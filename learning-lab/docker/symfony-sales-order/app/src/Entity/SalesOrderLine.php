<?php

namespace App\Entity;

use App\Repository\SalesOrderLineRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: SalesOrderLineRepository::class)]
class SalesOrderLine
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $id = null;

    #[ORM\ManyToOne(targetEntity: SalesOrder::class, inversedBy: 'lines')]
    #[ORM\JoinColumn(nullable: false)]
    private ?SalesOrder $order = null;

    #[ORM\ManyToOne(targetEntity: Sku::class)]
    #[ORM\JoinColumn(nullable: false, onDelete: 'RESTRICT')]
    private Sku $sku;

    #[ORM\Column(type: 'integer')]
    private int $quantity = 1;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private string $unitPrice;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOrder(): ?SalesOrder
    {
        return $this->order;
    }

    public function setOrder(?SalesOrder $order): self
    {
        $this->order = $order;
        return $this;
    }

    public function getSku(): Sku
    {
        return $this->sku;
    }

    public function setSku(Sku $sku): self
    {
        $this->sku = $sku;
        return $this;
    }

    public function getQuantity(): int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): self
    {
        $this->quantity = $quantity;
        return $this;
    }

    public function getUnitPrice(): string
    {
        return $this->unitPrice;
    }

    public function setUnitPrice(string $unitPrice): self
    {
        $this->unitPrice = $unitPrice;
        return $this;
    }

    public function getExtendedPrice(): float
    {
        return (float) $this->unitPrice * $this->quantity;
    }
}
