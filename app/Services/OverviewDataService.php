<?php

namespace App\Services;

use App\Models\Benchmark;
use App\Models\Portfolio;
use App\Models\User;
use App\Models\Wealth;

class OverviewDataService extends DataServiceAbstract
{
    /** @var string  */
    protected $valuationMethod;

    /** @var string  */
    protected $valuationDate;

    public function init(User $user, array $data)
    {
        $this->user = $user;
        $this->clientCode = $user->client_code;
        $this->valuationMethod = $data['method'] ?? null;
        $this->valuationDate = $data['date'] ?? null;
        $this->baseCurrency = $user->base_currency;

        $this->setFilters();
    }

    public function getPortfolioAllocation()
    {
        $portfolioAsset = Portfolio::asset(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->user->base_currency
        );

        return $portfolioAsset->pluck('mtd_percentage', 'kfp_asset_class');
    }

    public function getPortfolioAsset()
    {
        $portfolioAsset = Portfolio::asset(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->user->base_currency
        );

        $this->collection = $portfolioAsset;

        $portfolioAsset->push([
            'kfp_asset_class' =>'Total',
            'mtd_value' => $portfolioAsset->sum('mtd_value'),
            'mtd_pl' => $portfolioAsset->sum('mtd_pl'),
            'ytd_pl' => $portfolioAsset->sum('ytd_pl'),
            'mtd_percentage' => $portfolioAsset->sum('mtd_percentage'),
            'mtd_benchmark' => $portfolioAsset->sum('mtd_benchmark'),
            'ytd_percentage' => $portfolioAsset->sum('ytd_percentage'),
            'ytd_benchmark' => $portfolioAsset->sum('ytd_benchmark'),
            'total' => true,
            'active' => false,
        ]);

        return $portfolioAsset->toArray();
    }

    public function getTotalWealth()
    {
        $totalWealth = Wealth::total(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->user->base_currency
        );

        $totalWealth->push([
            'category' => 'Grant Total',
            'mtd_value' => $totalWealth->sum('mtd_value'),
            'mtd_pl' => $totalWealth->sum('mtd_pl'),
            'ytd_pl' => $totalWealth->sum('ytd_pl'),
            'mtd_percentage' => $totalWealth->sum('mtd_percentage'),
            'ytd_percentage' => $totalWealth->sum('ytd_percentage'),
            'mtd_benchmark' => $totalWealth->sum('mtd_benchmark'),
            'ytd_benchmark' => $totalWealth->sum('ytd_benchmark'),
            'total' => true,
            'active' => false,
        ]);

        return $totalWealth->toArray();
    }

    public function getTotalWealthAllocation()
    {
        $totalWealth = Wealth::total(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->user->base_currency
        );

        return $totalWealth->pluck('mtd_percentage', 'category');
    }

    public function getBenchmarks()
    {
        return Benchmark::data($this->valuationDate);
    }

    protected function setFilters()
    {
        $this->setValuationMethod();
        $this->setValuationDate();
    }

    protected function setValuationMethod()
    {
        $results = Portfolio::asset(
            $this->user->client_code,
            null,
            null,
            $this->user->base_currency
        );

        $this->collection = $results;
        $methods = $this->filters['method'] = $this->getValuationMethod();

        if (!$this->valuationMethod) {
            $this->valuationMethod = $methods[0]['code'];
        }
    }

    protected function setValuationDate()
    {
        $results = Portfolio::asset(
            $this->user->client_code,
            $this->valuationMethod,
            null,
            $this->user->base_currency
        );

        $this->collection = $results;

        $dates = $this->getValuationDate();

        $this->filters['date'] = $dates;
        if (!$this->valuationDate) {
            $this->valuationDate =  $dates[0];
        }

        $this->filters['currency'] = $this->getValuationCurrency();
    }

    public function getFilter($name)
    {
        return $this->filters[$name];
    }
}