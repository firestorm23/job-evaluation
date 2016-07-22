<?php

namespace SiteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use SiteBundle\Repository\GoodRepository;
use SiteBundle\Entity\Good;
use SiteBundle\Entity\Photo;
use Symfony\Component\HttpFoundation\Response;

class SiteController extends Controller
{

    /**
     *
     * @Route("/")
     */
    public function indexAction()
    {
        $price_type = 1;

        /** @var $rep GoodRepository*/
        $rep = $this->getDoctrine()->getRepository("SiteBundle:Good");
        $goods =$rep->getGoodsQueryBuilder($price_type);

        $viewGoods = array();

        /** @var $good Good*/
        foreach ($goods as $good) {
            $vGood = array();
            $vGood['title'] = $good->getTitle();
            $vGood['price'] = $good->getPrice($price_type);
            /** @var $photo Photo*/
            $filenames = array();
            foreach ($good->getPhotos() as $photo) {
                $filenames[] = $photo->getDirname()."/".$photo->getName();
            }
            $vGood['files'] = implode("\n", $filenames);

            $viewGoods[] = $vGood;
        }

        return $this->render('SiteBundle:Site:index.html.twig', array('goods' => $viewGoods));

    }

    /**
     *
     * @Route("/native")
     */

    public function nativeSqlAction()
    {
        $goods = $article_repository = $this->getDoctrine()->getRepository("SiteBundle:Good")->getGoodsNative(1);

        return $this->render('SiteBundle:Site:index.html.twig', array('goods' => $goods));
    }

}
