<?php

namespace App\Controller;

use App\Entity\Sku;
use App\Form\SkuType;
use App\Repository\SkuRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/skus')]
class SkuController extends AbstractController
{
    #[Route('/', name: 'symfony_sku_index')]
    public function index(SkuRepository $skus): Response
    {
        return $this->render('orders/skus.html.twig', [
            'skus' => $skus->findAll(),
        ]);
    }

    #[Route('/new', name: 'symfony_sku_new')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        $sku = new Sku();
        $form = $this->createForm(SkuType::class, $sku);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($sku);
            $em->flush();

            $this->addFlash('success', 'SKU saved');
            return $this->redirectToRoute('symfony_sku_index');
        }

        return $this->render('orders/sku_form.html.twig', [
            'form' => $form,
        ]);
    }
}
