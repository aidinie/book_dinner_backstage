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
    //更新购物车
    public function updateCart(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $did = $params1->did;
            $num = $params1->num;
            $uid = $params1->uid;
            $result = $this->user_model->update_card($did,$num,$uid);
            echo $result;
        }

    }
    //删除购物车某条记录
    public function deleteCartById(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $id = $params1->id;
            $result = $this->user_model->delete_card_by_id($id);
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
    //添加收货地址
    public function insertReceiptInfo()
    {
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $name = $params1->name;
            $phone = $params1->phone;
            $address = $params1->address;
            $uid = $params1->uid;
            $result = $this->user_model->insert_receipt_info($name,$phone,$address,$uid);
            echo $result;
        }

    }
    //获取收货信息
    public function getAddressInfo(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $uid = $params1->uid;
            $result = $this->user_model->get_address_info($uid);
            echo $result;
        }
    }
    //更新收货信息
    public function updateAddressInfo(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $id = $params1->id;
            $uid = $params1->uid;
            $name = $params1->name;
            $phone = $params1->phone;
            $address = $params1->address;
            $result = $this->user_model->update_address_info($id,$uid,$name,$phone,$address);
            echo $result;
        }
    }
    //删除收货信息
    public function deleteAddressInfo(){
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
        header("Access-Control-Allow-Origin: *");
        $params = file_get_contents("php://input");
        $params1 = json_decode($params);
        if($params1){
            $id = $params1->id;
            $uid = $params1->uid;
            $result = $this->user_model->delete_address_info($id,$uid);
            echo $result;
        }
    }
}
