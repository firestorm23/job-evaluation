<?php

namespace SiteBundle\Entity;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Good
 */
class Good
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $title;

    /**
     * @var string
     */
    private $description;

    /**
     * @var array
     */

    private $photos;

    /**
     * @var array
     */

    private $prices;


    function __construct()
    {
        $this->photos = new ArrayCollection();
        $this->prices = new ArrayCollection();
    }

    /**
     * @return array
     */
    public function getPhotos()
    {
        return $this->photos;
    }

    /**
     * @param array $photos
     */
    public function setPhotos($photos)
    {
        $this->photos = $photos;
    }

    /**
     * @param Photo $photo
     */
    public function addPhotos($photo)
    {
        $this->photos[] = $photo;
    }

    /**
     * @return array
     */
    public function getPrices()
    {
        return $this->prices;
    }

    public function getPrice($type)
    {
        return $this->prices[$type]->getPrice();
    }

    /**
     * @param array $prices
     */
    public function setPrices($prices)
    {
        $this->prices = $prices;


        /** @var $price Price*/
        foreach ($prices as $price) {
            fileDump(get_class($price->getGood()), true);
            $price->setGood($this);
        }
    }

    /**
     * @param Price $price
     */
    public function addPrices($price)
    {
        $price->setGood($this);
        $this->prices[] = $price;

        fileDump(get_class($price->getGood()), true);
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
     * Set title
     *
     * @param string $title
     *
     * @return Good
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Good
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }
}

