<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateCurrencyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('currency', function (Blueprint $table) {
            $table->id();
            $table->string('currency', 10);
            $table->string('category', 50);
            $table->bigInteger('aum');
            $table->timestamps();
        });

        $procedure = "
    CREATE PROCEDURE `fn_get_currency`()
    BEGIN
         SELECT currency, category, aum FROM currency;
    END
";

        DB::unprepared("DROP PROCEDURE IF EXISTS fn_get_currency");
        DB::unprepared($procedure);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('currency');
    }
}
