# Expert Network — architecture foundation

Status: schema, models and matching service only (Phase 1.0). No public UI or payments yet.

| Concept | Table | Notes |
|---|---|---|
| Expertise categories | `expertise_categories` | Hierarchical via `parent_id`. |
| Expert profiles | `expert_profiles` | One per `tl_users` user. `verification_status` is not mass-assignable. |
| Profile ↔ category | `expert_profile_category` | `level` 1–5 self-declared depth. |
| Verification | `expert_verifications` | Evidence JSON + reviewer; mirrors company verification. |
| Engagements | `expert_engagements` | Company ↔ expert; optional `order_id` links to shared commerce. |
| Sessions | `expert_sessions` | Scheduled calls within an engagement. |
| Rubrics | `assessment_rubrics` | Versioned (`key`, `version`) weighted criteria. |
| Assessments | `assessments` | Scores per rubric; `AssessmentRubric::score()` gives a 0–100 weighted result. |
| Findings / recommendations | `assessment_findings` | Severity, recommendation, status. |
| Company knowledge | `company_knowledge_records` | Polymorphic `source` (assessment, session, Brand Press, etc.), scoped by company. |

Matching (`App\Services\Expert\ExpertMatcher`) returns only verified, available experts ranked by
category coverage (70%), declared depth (20%) and experience (10%). It can later be replaced by an
AI- or embedding-based ranker behind the same `match()` signature.

Next steps: expert onboarding UI, admin verification queue (reuse company verification patterns),
engagement checkout as a `FulfilsOrders` product, session scheduling, and company access to
knowledge records through `company.member:view` scoping.
