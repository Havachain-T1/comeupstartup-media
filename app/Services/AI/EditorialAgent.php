<?php

namespace App\Services\AI;

enum EditorialAgent: string
{
    case TechnologyJournalist = 'technology_journalist';
    case StartupReporter = 'startup_reporter';
    case FundingReporter = 'funding_reporter';
    case BusinessAnalyst = 'business_analyst';
    case PolicyResearcher = 'policy_researcher';
    case OpportunitiesResearcher = 'opportunities_researcher';
    case FactChecker = 'fact_checker';
    case SeoEditor = 'seo_editor';
    case NewsletterEditor = 'newsletter_editor';

    public function label(): string
    {
        return ucwords(str_replace('_', ' ', $this->value)) === 'Seo Editor' ? 'SEO Editor' : ucwords(str_replace('_', ' ', $this->value));
    }

    public function promptKey(): string
    {
        return 'agent.' . $this->value;
    }
}
