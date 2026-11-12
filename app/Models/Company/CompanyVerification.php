<?php

namespace App\Models\Company;

use Illuminate\Database\Eloquent\Model;

class CompanyVerification extends Model
{
    protected $fillable = ['company_id', 'status', 'submitted_by', 'notes', 'submitted_at'];

    protected $casts = ['submitted_at' => 'datetime', 'reviewed_at' => 'datetime'];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function documents()
    {
        return $this->hasMany(CompanyDocument::class);
    }
}
