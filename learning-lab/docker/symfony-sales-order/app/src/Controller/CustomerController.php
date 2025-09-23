<?php

namespace App\Controller;

use App\Entity\Customer;
use App\Form\CustomerType;
use App\Repository\CustomerRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/customers')]
class CustomerController extends AbstractController
{
    #[Route('/', name: 'symfony_customer_index')]
    public function index(CustomerRepository $customers): Response
    {
        return $this->render('orders/customers.html.twig', [
            'customers' => $customers->findAll(),
        ]);
    }

    #[Route('/new', name: 'symfony_customer_new')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        $customer = new Customer();
        $form = $this->createForm(CustomerType::class, $customer);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($customer);
            $em->flush();

            $this->addFlash('success', 'Customer saved');
            return $this->redirectToRoute('symfony_customer_index');
        }

        return $this->render('orders/customer_form.html.twig', [
            'form' => $form,
        ]);
    }
}
