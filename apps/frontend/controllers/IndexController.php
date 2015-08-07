<?php
/**
 * Created by Jacky.
 * User: Jacky
 * E-Mail: jacky@carocrm.com or jacky@youaddon.com
 * Date: 8/6/2015
 * Time: 5:52 PM
 * Project: XemPhimGi
 * File: Movies.php
 */

namespace Modules\Frontend\Controllers;

use Modules\Frontend\Models\Categories;
use Modules\Frontend\Models\Episodes;
use Modules\Frontend\Models\Movies;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class IndexController extends ControllerBase
{

    /**
     * Home Page
     */
    public function indexAction()
    {
        $cat_id = $this->request->getQuery('cat_id');
        $q = $this->request->getQuery('q');
        if ($q) {
            $where = "name like :name:";
        }

        if (!$cat_id) {
            $videos = Movies::find(array(
                $where,
                'bind' => array('name' => '%' . $q . '%'),
                "order" => "id DESC"
            ));
        } else {
            $namespace = 'Modules\Frontend\Models\\';
            $videos = $this->modelsManager->createBuilder()
                ->from("{$namespace}Movies")
                ->join("{$namespace}MovieCategory", "{$namespace}Movies.id = {$namespace}MovieCategory.movie_id")
                ->join("{$namespace}Categories", "{$namespace}Categories.id = {$namespace}MovieCategory.category_id")
                ->where("{$namespace}Categories.id = {$cat_id}")
                ->orderBy("{$namespace}Movies.id DESC")
                ->getQuery()->execute();
        }

        $currentPage = $this->request->getQuery('page');
        $paginator_limit = 18; // @TODO
        $paginator = new PaginatorModel(array(
            "data" => $videos,
            "limit" => $paginator_limit,
            "page" => $currentPage
        ));

        $page = $paginator->getPaginate();

        $this->view->videos = $page->items;
        $this->view->page = $page;

        $query_urls = $this->request->getQuery();
        unset($query_urls['_url']);
        unset($query_urls['submit']);
        unset($query_urls['page']);
        $query_urls = !empty($query_urls) ? $query_urls : array('xpg' => 1);

        $this->view->current_url = $this->url->get('/', $query_urls);
    }

    /**
     * Detail Video
     *
     * @param int|null $id
     */
    public function detailAction($id = null)
    {
        if (!$id) {
            $this->response->redirect('/');
        }

        $video = Movies::findFirst($id);
        $video_media = Episodes::findFirst("movie_id = $id");

        $namespace = 'Modules\Frontend\Models\\';

        $categories = $this->modelsManager->createBuilder()
            ->from("{$namespace}Categories")
            ->join("{$namespace}MovieCategory", "{$namespace}Categories.id = {$namespace}MovieCategory.category_id")
            ->join("{$namespace}Movies", "{$namespace}Movies.id = {$namespace}MovieCategory.movie_id")
            ->where("{$namespace}Movies.id = $id")
            ->limit(1)
            ->getQuery()->execute();

        foreach ($categories as $category) {
            $relate_videos = $this->modelsManager->createBuilder()
                ->from("{$namespace}Movies")
                ->join("{$namespace}MovieCategory", "{$namespace}Movies.id = {$namespace}MovieCategory.movie_id")
                ->join("{$namespace}Categories", "{$namespace}Categories.id = {$namespace}MovieCategory.category_id")
                ->where("{$namespace}Categories.id = {$category->id}")
                ->limit(6)
                ->getQuery()->execute();
        }

        $this->view->video = $video;
        $this->view->video_media = $video_media;
        $this->view->relate_videos = $relate_videos;
    }

    /**
     * list_categoriesAction
     */
    public function list_categoriesAction()
    {
        $this->view->disable();
        $categories = Categories::find(array(
            "order" => "id DESC"
        ));

        echo '
            <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                Thể Loại
            </li>
        ';
        foreach ($categories as $category) {
            echo '
                <li>
                    <a href="'. $this->url->get('/', array('cat_id' => $category->id)) .'" class="auto">
                        <i class="icon-screen-desktop icon"></i>
                        <span>'. $category->name .'</span>
                    </a>
                </li>
            ';
        }
    }
}
