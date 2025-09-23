<?php

namespace App\Form;

use App\Entity\SalesOrderLine;
use App\Entity\Sku;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SalesOrderLineType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('sku', EntityType::class, [
                'class' => Sku::class,
                'choice_label' => 'code',
            ])
            ->add('quantity', IntegerType::class)
            ->add('unitPrice', MoneyType::class, [
                'currency' => 'USD',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => SalesOrderLine::class,
        ]);
    }
}
