<?php

namespace App\Controller;

use App\Repository\CustomerRepository;
use App\Repository\SalesOrderRepository;
use App\Repository\SkuRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractController
{
    #[Route('/', name: 'symfony_dashboard')]
    public function index(CustomerRepository $customers, SkuRepository $skus, SalesOrderRepository $orders): Response
    {
        return $this->render('orders/dashboard.html.twig', [
            'customerCount' => $customers->count([]),
            'skuCount' => $skus->count([]),
            'orderCount' => $orders->count([]),
        ]);
    }
}
