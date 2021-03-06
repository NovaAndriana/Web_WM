<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductExtrasGroupLanguage extends Model {
    protected $table = "product_extra_groups_language";
    protected $primaryKey = "id";

    public $timestamps = false;

    protected $guarded = [];

    public function language() {
        return $this->belongsTo(Languages::class, "id_lang", "id");
    }
}
