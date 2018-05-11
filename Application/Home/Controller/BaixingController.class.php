<?php
namespace Home\Controller;
use Think\Controller;
class BaixingController extends Controller {

    public function __construct()
    {
        parent::__construct();
        layout(false);
    }

    public function index()
    {
        $this->display();
    }
}