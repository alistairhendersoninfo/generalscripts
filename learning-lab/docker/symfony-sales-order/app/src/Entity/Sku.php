<?php

namespace App\Entity;

use App\Repository\SkuRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: SkuRepository::class)]
class Sku
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $id = null;

    #[ORM\Column(length: 60, unique: true)]
    private string $code;

    #[ORM\Column(length: 255)]
    private string $description;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private string $unitPrice;

    #[ORM\Column(type: 'boolean')]
    private bool $isActive = true;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCode(): string
    {
        return $this->code;
    }

    public function setCode(string $code): self
    {
        $this->code = $code;
        return $this;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;
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

    public function isActive(): bool
    {
        return $this->isActive;
    }

    public function setIsActive(bool $active): self
    {
        $this->isActive = $active;
        return $this;
    }

    public function __toString(): string
    {
        return sprintf('%s - %s', $this->code, $this->description);
    }
}
