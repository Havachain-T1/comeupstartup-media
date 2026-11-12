<?php

namespace App\Models\Expert;

use Illuminate\Database\Eloquent\Model;

class CompanyKnowledgeRecord extends Model
{
    protected $guarded = ['id'];

    public function company()
    {
        return $this->belongsTo(\App\Models\Company\Company::class);
    }

    public function source()
    {
        return $this->morphTo();
    }
}
