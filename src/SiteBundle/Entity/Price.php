<?php

namespace SiteBundle\Entity;

/**
 * Price
 */
class Price
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $priceTypeId;

    /**
     * @var int
     */
    private $price;
    /**
     * @var Good
     */
    private $good;

    /**
     * @return Good
     */
    public function getGood()
    {
        return $this->good;
    }

    /**
     * @param Good $good
     */
    public function setGood($good)
    {
        $this->good = $good;
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Get priceTypeId
     *
     * @return int
     */
    public function getPriceTypeId()
    {
        return $this->priceTypeId;
    }

    /**
     * Set priceTypeId
     *
     * @param integer $priceTypeId
     *
     * @return Price
     */
    public function setPriceTypeId($priceTypeId)
    {
        $this->priceTypeId = $priceTypeId;

        return $this;
    }

    /**
     * Get price
     *
     * @return int
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set price
     *
     * @param integer $price
     *
     * @return Price
     */
    public function setPrice($price)
    {
        $this->price = $price;

        return $this;
    }
}

