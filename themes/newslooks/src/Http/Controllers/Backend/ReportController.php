<?php

namespace Theme\NewsLooks\Http\Controllers\Backend;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Theme\NewsLooks\Models\Visitor;
use App\Http\Controllers\Controller;

class ReportController extends Controller
{
  /**
   * get website visitors report
   * @param Request $request
   * @return Response
   */
  public function visitorReports(Request $request)
  {
    if ($request['type'] == 'monthly') {
      $times = [];
      $visitors = [];

      for ($i = 11; $i >= 0; $i--) {
        $month = now()->subMonths($i);
        $visitorsCount = Visitor::whereYear('visited_at', $month->year)
          ->whereMonth('visited_at', $month->month)
          ->count();

        $times[] = $month->shortMonthName;
        $visitors[] = $visitorsCount;
      }

      return response()->json([
        'success' => true,
        'times' => $times,
        'visitors' => $visitors,
      ]);
    }

    if ($request['type'] == 'daily') {
      $times = [];
      $visitors = [];
      for ($i = 29; $i >= 0; $i--) {

        $day = Carbon::today()->endOfDay()->subDay($i);
        $total_visitors = Visitor::whereDate('visited_at', $day)->count();
        array_push($visitors, $total_visitors);

        array_push($times, $day->format('d M'));
      }

      return response()->json([
        'success' => true,
        'times' => $times,
        'visitors' => $visitors,
      ]);
    }
  }

  /**
   * Country Reports
   */
  public function countryReports(Request $request)
  {

    if ($request['type'] == 'monthly') {

      $currentMonth = Carbon::now()->month;
      $currentYear = Carbon::now()->year;

      DB::statement("SET SQL_MODE=''");
      $total_visitors = DB::table('visitors')
        ->whereMonth('visited_at', $currentMonth)
        ->whereYear('visited_at', $currentYear)
        ->selectRaw('count(id) as number_of_visitors, country as filter_data')
        ->groupBy('filter_data')
        ->orderBy('number_of_visitors', 'desc')
        ->get();
    }

    if ($request['type'] == 'daily') {
      $currentDate = Carbon::now()->toDateString();

      DB::statement("SET SQL_MODE=''");
      $total_visitors = DB::table('visitors')
        ->whereDate('visited_at', $currentDate)
        ->selectRaw('count(id) as number_of_visitors, country as filter_data')
        ->groupBy('filter_data')
        ->orderBy('number_of_visitors', 'desc')
        ->get();
    }

    $result = $this->calculateReports($total_visitors);

    return response()->json([
      'success' => true,
      'percentage' => $result['percentage_array'],
      'countries' => $result['filter_datas']
    ]);
  }

  /**
   * Browser Reports
   */
  public function browserReports(Request $request)
  {

    if ($request['type'] == 'monthly') {

      $currentMonth = Carbon::now()->month;
      $currentYear = Carbon::now()->year;

      DB::statement("SET SQL_MODE=''");
      $total_visitors = DB::table('visitors')
        ->whereMonth('visited_at', $currentMonth)
        ->whereYear('visited_at', $currentYear)
        ->selectRaw('count(id) as number_of_visitors, user_agent as filter_data')
        ->groupBy('filter_data')
        ->orderBy('number_of_visitors', 'desc')
        ->get();
    }

    if ($request['type'] == 'daily') {
      $currentDate = Carbon::now()->toDateString();

      DB::statement("SET SQL_MODE=''");
      $total_visitors = DB::table('visitors')
        ->whereDate('visited_at', $currentDate)
        ->selectRaw('count(id) as number_of_visitors, user_agent as filter_data')
        ->groupBy('filter_data')
        ->orderBy('number_of_visitors', 'desc')
        ->get();
    }

    $result = $this->calculateReports($total_visitors);

    return response()->json([
      'percentage' => $result['percentage_array'],
      'browsers' => $result['filter_datas']
    ]);
  }

  /**
   * Browser Reports
   */
  public function deviceReports(Request $request)
  {

    if ($request['type'] == 'monthly') {

      $currentMonth = Carbon::now()->month;
      $currentYear = Carbon::now()->year;

      DB::statement("SET SQL_MODE=''");
      $total_visitors = DB::table('visitors')
        ->whereMonth('visited_at', $currentMonth)
        ->whereYear('visited_at', $currentYear)
        ->selectRaw('count(id) as number_of_visitors, device as filter_data')
        ->groupBy('filter_data')
        ->orderBy('number_of_visitors', 'desc')
        ->get();
    }

    if ($request['type'] == 'daily') {
      $currentDate = Carbon::now()->toDateString();

      DB::statement("SET SQL_MODE=''");
      $total_visitors = DB::table('visitors')
        ->whereDate('visited_at', $currentDate)
        ->selectRaw('count(id) as number_of_visitors, device as filter_data')
        ->groupBy('filter_data')
        ->orderBy('number_of_visitors', 'desc')
        ->get();
    }

    $result = $this->calculateReports($total_visitors);

    return response()->json([
      'percentage' => $result['percentage_array'],
      'devices' => $result['filter_datas']
    ]);
  }


  /**
   * Calculate Reports
   */
  public function calculateReports($total_visitors)
  {
    $total = 0;
    $filter_datas = [];
    $visitors = [];
    $otherIndex = null;

    foreach ($total_visitors as $key => $data) {
      $total += $data->number_of_visitors;

      if ($key <= 4) {
        // If others is available in first 5 element the get the Others index
        if ($data->filter_data == 'Others') {
          $otherIndex = $key;

          if (count($total_visitors) > 5) {
            continue;
          }
        }

        // insert data but not others
        $filter_datas[] = $data->filter_data;
        $visitors[] = $data->number_of_visitors;

      } else {

        if ($key == 5) {
          $filter_datas[4] = 'Others';
        }

        if ($key > 5) {
          $visitors[4] = $visitors[4] + $data->number_of_visitors;
        } else {
          if (isset($otherIndex)) {
            $visitors[] = $data->number_of_visitors + (isset($otherIndex) ? $total_visitors[$otherIndex]->number_of_visitors : 0);
          } else {
            $visitors[4] = $visitors[4] + $data->number_of_visitors;
          }
        }
      }
    }

    $percentage_array = array_map(function ($visitor) use ($total) {
      return (int)number_format(($visitor / $total) * 100, 2);
    }, $visitors);

    return [
      'filter_datas' => $filter_datas,
      'percentage_array' => $percentage_array
    ];
  }
}
