<?php

namespace App\Controller;

use App\Entity\CustomerAddress;
use App\Form\CustomerAddressType;
use App\Repository\CustomerAddressRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/addresses')]
class AddressController extends AbstractController
{
    #[Route('/', name: 'symfony_address_index')]
    public function index(CustomerAddressRepository $addresses): Response
    {
        return $this->render('orders/addresses.html.twig', [
            'addresses' => $addresses->findAll(),
        ]);
    }

    #[Route('/new', name: 'symfony_address_new')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        $address = new CustomerAddress();
        $form = $this->createForm(CustomerAddressType::class, $address);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($address);
            $em->flush();

            $this->addFlash('success', 'Address saved');
            return $this->redirectToRoute('symfony_address_index');
        }

        return $this->render('orders/address_form.html.twig', [
            'form' => $form,
        ]);
    }
}
