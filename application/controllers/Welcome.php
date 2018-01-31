<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }

    public function index()
    {
        $this->load->view('welcome_message');
    }

    public function detail()
    {
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
//        echo $_GET['id'];
//        exit();
        $dish = $this->user_model->get_by_id($_GET['id']);
        if ($dish) {
            echo $dish;
            //$this->load->view('single', array('product'=>$product));
        }
    }

    public function register()
    {
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        //读取post传的json格式
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if ($params1) {
            $name = $params1->name;
            $sex = $params1->sex;
            $pass = $params1->pass;
            $number = $params1->number;
            $result = $this->user_model->insertUser($name, $pass, $number, $sex);
            echo $result;
        }

    }
    public function getDishes(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $category = $params1->category;
            $result = $this->user_model->get_dishes_by_category($category);
            echo $result;

        }

    }
}
