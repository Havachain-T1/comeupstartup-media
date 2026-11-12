<?php

namespace App\Notifications;

use App\Models\Company\Company;
use App\Models\Company\CompanyInvitation;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CompanyInvitationNotification extends Notification
{
    public function __construct(private Company $company, private CompanyInvitation $invitation, private string $link)
    {
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage())
            ->subject(__('You have been invited to join :company', ['company' => $this->company->name]))
            ->line(__(':company invited you to join as :role.', ['company' => $this->company->name, 'role' => $this->invitation->roleEnum()->label()]))
            ->action(__('View invitation'), $this->link)
            ->line(__('This invitation expires on :date.', ['date' => $this->invitation->expires_at->toFormattedDateString()]));
    }
}
