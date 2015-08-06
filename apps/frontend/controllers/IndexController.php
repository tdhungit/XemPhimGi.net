<?php

namespace Modules\Frontend\Controllers;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->videos = array(
            1,2,3,4,5,6
        );
    }

    public function detailAction($id = null)
    {

    }
}
