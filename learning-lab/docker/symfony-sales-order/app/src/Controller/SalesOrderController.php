<?php

namespace App\Controller;

use App\Entity\SalesOrder;
use App\Form\SalesOrderType;
use App\Repository\SalesOrderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/orders')]
class SalesOrderController extends AbstractController
{
    #[Route('/', name: 'symfony_order_index')]
    public function index(SalesOrderRepository $orders): Response
    {
        return $this->render('orders/orders.html.twig', [
            'orders' => $orders->findAll(),
        ]);
    }

    #[Route('/new', name: 'symfony_order_new')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        $order = new SalesOrder();
        $form = $this->createForm(SalesOrderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            foreach ($order->getLines() as $line) {
                $line->setOrder($order);
            }
            $em->persist($order);
            $em->flush();

            $this->addFlash('success', 'Order saved');
            return $this->redirectToRoute('symfony_order_index');
        }

        return $this->render('orders/order_form.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/{id}/edit', name: 'symfony_order_edit')]
    public function edit(SalesOrder $order, Request $request, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(SalesOrderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            foreach ($order->getLines() as $line) {
                $line->setOrder($order);
            }
            $em->flush();

            $this->addFlash('success', 'Order updated');
            return $this->redirectToRoute('symfony_order_index');
        }

        return $this->render('orders/order_form.html.twig', [
            'form' => $form,
            'editing' => true,
        ]);
    }
}
