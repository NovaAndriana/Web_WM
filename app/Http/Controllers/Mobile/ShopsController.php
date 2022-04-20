<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Repositories\Interfaces\ShopInterface;
use App\Repositories\ShopPaymentRepository;
use App\Repositories\ShopShippingBoxRepository;
use Illuminate\Http\Request;

class ShopsController extends Controller
{
    private $shopRepository;

    public function __construct(ShopInterface $shop)
    {
        $this->shopRepository = $shop;
    }

    public function categories(Request $request)
    {
        return $this->shopRepository->getShopCategories($request->id_lang);
    }

    public function shops(Request $request)
    {
        return $this->shopRepository->getShopsForRest($request->all());
    }

    public function timeunits(Request $request)
    {
        return $this->shopRepository->getTimeUnitsForRest($request->id_shop);
    }

    public function getShopUser(Request $request)
    {
        return $this->shopRepository->getShopUser($request->id_shop);
    }

    public function shopShippingBox(Request $request){
        return (new ShopShippingBoxRepository())->active($request->all());
    }

    public function getShopById($shop_id, Request $request){
        return  $this->shopRepository->getShopForRest($shop_id, $request->lang_id);
    }

    public function getPaymentsForBalanceTopup(Request $request){
        return  (new ShopPaymentRepository())->paymentForBalanceTopup($request->shop_id);
    }
}
