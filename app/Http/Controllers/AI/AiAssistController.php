<?php

namespace App\Http\Controllers\AI;

use App\Http\Controllers\Controller;
use App\Models\Company\Company;
use App\Services\AI\AiException;
use App\Services\AI\AiService;
use App\Services\AI\EditorialAgent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AiAssistController extends Controller
{
    public function brandPress(Request $request, Company $company, AiService $ai)
    {
        $data = $request->validate(['notes' => 'required|string|min:30|max:8000', 'title' => 'nullable|string|max:225', 'tone' => 'nullable|in:neutral,confident,formal']);

        return $this->respond(fn () => $ai->generate('brand_press.writer', ['company' => $company->name, 'tone' => $data['tone'] ?? 'neutral', 'title' => $data['title'] ?? '', 'notes' => $data['notes']], $request->user(), $company));
    }

    public function agents(AiService $ai)
    {
        $usage = DB::table('ai_requests')->where('created_at', '>=', now()->subDays(30))
            ->selectRaw('COUNT(*) as requests, SUM(status = "error") as errors, SUM(input_tokens + output_tokens) as tokens, SUM(cost_micros) as cost_micros')->first();

        return view('admin.ai.index', ['agents' => EditorialAgent::cases(), 'available' => $ai->available(), 'provider' => $ai->providerName(), 'usage' => $usage]);
    }

    public function runAgent(Request $request, string $agent, AiService $ai)
    {
        $agent = EditorialAgent::tryFrom($agent) ?? abort(404);
        $data = $request->validate(['brief' => 'required|string|min:10|max:8000', 'sources' => 'nullable|string|max:8000']);

        return $this->respond(fn () => $ai->generate($agent->promptKey(), $data, $request->user(), null, $agent));
    }

    private function respond(callable $run)
    {
        try {
            $result = $run();
        } catch (AiException $e) {
            return response()->json(['message' => $e->getMessage(), 'reason' => $e->reason], $e->reason === AiException::LIMIT ? 429 : 503);
        }

        return response()->json(['text' => $result->text, 'prompt' => $result->promptKey . '@v' . $result->promptVersion, 'requires_human_approval' => true]);
    }
}
