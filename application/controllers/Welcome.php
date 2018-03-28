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
    //获取菜品详情
    public function dishDetail()
    {
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $id = $params1->id;
            $dish = $this->user_model->get_by_id($id);
            if ($dish) {
                echo $dish;
                //$this->load->view('single', array('product'=>$product));
            }
        }

    }
    //加入购物车
    public function insertCart()
    {
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $did = $params1->id;
            $dname = $params1->name;
            $price = $params1->price;
            $num = $params1->num;
            $uid = $params1->uid;
            $result = $this->user_model->insert_card($did,$dname,$price,$num,$uid);
            echo $result;
        }

    }

    //注册
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
    //通过category获取菜品
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
    //注册时验证手机号是否被注册
    public function checkExist(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $number = $params1->number;
            $result = $this->user_model->check_user_exist($number);
            echo $result;
        }
    }
    //验证登陆
    public function login(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        //echo $params;
        if($params1){
            $number = $params1->number;
            $pass = $params1->pass;
            $result = $this->user_model->login($number,$pass);
            echo $result;
        }
    }
    //获取购物车菜品
    public function getCartDishes(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $uid = $params1->uid;
            $result = $this->user_model->get_cart_dish_by_id($uid);
            echo $result;
        }
    }
    //获取购物车菜品总数量
    public function getCartDishesNum(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $uid = $params1->uid;
            $result = $this->user_model->get_cart_dishes_num($uid);
            //var_dump($result);
            echo $result;
        }
    }
}
