<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TrackVisitor
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        try {
            $ipInfo = json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . getUserIpAddr()));
            $data['country'] =  isset($ipInfo->geoplugin_countryName) ? $ipInfo->geoplugin_countryName : 'Others';
        } catch (\Exception $e) {
            $data['country'] =  'Others';
        }

        $data['ip_address'] = getUserIpAddr();
        $data['user_agent'] =  get_browser_name();
        $data['device'] =  get_operating_system();
        $data['visited_at'] = now()->toDateTimeString();

        DB::table('visitors')->insert($data);

        return $next($request);
    }
}
