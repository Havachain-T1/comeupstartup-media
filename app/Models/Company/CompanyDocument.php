<?php

namespace App\Models\Company;

use Illuminate\Database\Eloquent\Model;

class CompanyDocument extends Model
{
    public const TYPES = [
        'registration_certificate' => 'Certificate of incorporation / registration',
        'tax_certificate' => 'Tax identification certificate',
        'proof_of_address' => 'Proof of business address',
        'director_id' => 'Director identification',
        'other' => 'Other supporting document',
    ];

    protected $fillable = ['company_id', 'company_verification_id', 'type', 'original_name', 'disk', 'path', 'mime_type', 'size', 'uploaded_by'];

    protected $hidden = ['path', 'disk'];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }
}
