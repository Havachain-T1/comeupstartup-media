<?php

namespace App\Enums;

enum CompanyRole: string
{
    case Owner = 'owner';
    case Administrator = 'administrator';
    case Editor = 'editor';
    case MarketingManager = 'marketing_manager';
    case FinanceManager = 'finance_manager';
    case Viewer = 'viewer';

    /** Server-side capability map. Every company-scoped action is checked against this. */
    private const ABILITIES = [
        'view' => ['owner', 'administrator', 'editor', 'marketing_manager', 'finance_manager', 'viewer'],
        'update_profile' => ['owner', 'administrator'],
        'manage_members' => ['owner', 'administrator'],
        'manage_verification' => ['owner', 'administrator'],
        'delete_company' => ['owner'],
        'create_content' => ['owner', 'administrator', 'editor', 'marketing_manager'],
        'submit_content' => ['owner', 'administrator', 'editor', 'marketing_manager'],
        'manage_billing' => ['owner', 'administrator', 'finance_manager'],
        'view_billing' => ['owner', 'administrator', 'finance_manager'],
        'view_analytics' => ['owner', 'administrator', 'editor', 'marketing_manager', 'finance_manager', 'viewer'],
    ];

    public function label(): string
    {
        return match ($this) {
            self::Owner => 'Owner',
            self::Administrator => 'Administrator',
            self::Editor => 'Editor',
            self::MarketingManager => 'Marketing Manager',
            self::FinanceManager => 'Finance Manager',
            self::Viewer => 'Viewer',
        };
    }

    public function can(string $ability): bool
    {
        return in_array($this->value, self::ABILITIES[$ability] ?? [], true);
    }

    /** Roles a member holding this role may assign to others. Only owners can create owners. */
    public function assignableRoles(): array
    {
        if (!$this->can('manage_members')) {
            return [];
        }

        return array_values(array_filter(self::cases(), fn (self $r) => $this === self::Owner || $r !== self::Owner));
    }

    public static function abilities(): array
    {
        return array_keys(self::ABILITIES);
    }
}
