<?php

namespace App\Form;

use App\Entity\Customer;
use App\Entity\CustomerAddress;
use App\Entity\SalesOrder;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SalesOrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('customer', EntityType::class, [
                'class' => Customer::class,
                'choice_label' => 'name',
            ])
            ->add('shippingAddress', EntityType::class, [
                'class' => CustomerAddress::class,
                'choice_label' => 'label',
            ])
            ->add('orderDate', DateType::class, [
                'widget' => 'single_text',
            ])
            ->add('status', ChoiceType::class, [
                'choices' => [
                    'Draft' => SalesOrder::STATUS_DRAFT,
                    'Confirmed' => SalesOrder::STATUS_CONFIRMED,
                    'Fulfilled' => SalesOrder::STATUS_FULFILLED,
                ],
            ])
            ->add('notes', TextareaType::class, [
                'required' => false,
            ])
            ->add('lines', CollectionType::class, [
                'entry_type' => SalesOrderLineType::class,
                'allow_add' => true,
                'allow_delete' => true,
                'by_reference' => false,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => SalesOrder::class,
        ]);
    }
}
