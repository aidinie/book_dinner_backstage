<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class User_model extends CI_Model
{
//    public function get_by_name_and_pwd($username, $password)
//    {
//        return $this->db->get_where('t_user', array('username' => $username, 'password' => $password))->row();
//    }

    //通过id查询菜品详情
    public function get_by_id($prod_id)
    {
        $dish = $this->db->get_where('dish', array('did' => $prod_id))->row();
        if ($dish) {
            echo json_encode($dish);
            // $this->load->view('single', array('dish'=>$dish_json));
        }
    }
    //注册用户插入数据库
    public function insertUser($name, $pass, $number, $sex)
    {

        $data = array(
            'name' => $name,
            'password' => $pass,
            'phone' => $number,
            'sex' => $sex
        );
        $bool = $this->db->insert('user', $data);
        if ($bool) {
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'error');
            echo json_encode($arr);
        }

    }
    //通过category获取菜品列表
    public function get_dishes_by_category($category)
    {
        $dishes = $this->db->get_where('dish', array('category' => $category))->result();
        if ($dishes) {
            echo json_encode($dishes);
        }
    }
    //查询手机是否被注册
    public function check_user_exist($number)
    {
        $result = $this->db->get_where('user', array('phone' => $number))->row();
        if ($result) {
            $arr = array('flag' => 'exist');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        }
    }
    //验证登陆
    public function login($number,$pass){
        $result = $this->db->get_where('user',array('phone' => $number, 'password' => $pass)) ->row();
        if($result){
            $arr = array('uid' => $result->uid,'name' => $result->name,'permission' => $result->permission,'flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'error');
            echo json_encode($arr);
        }
    }
    //通过用户id查询购物车菜品
    public function get_cart_dish_by_id($uid){
        $result = $this->db->get_where('cart',array('uid' => $uid)) ->result();
        if($result){
            echo json_encode($result);
        } else {
            $arr = array('flag' => 'empty');
            echo json_encode($arr);
        }
    }
    //Select Sum(num) as "ScrTotal" from cart where uid=38
    //查询购物车商品总数量
    public function get_cart_dishes_num($uid){
        $sql = "Select Sum(num) as total from cart where uid=$uid";
        $num = $this->db->query($sql)->row();
        echo json_encode($num);
    }
    public function insert_card($did,$dname,$price,$num,$uid){
        $result = $this->db->get_where('cart', array('did' => $did))->row();
        if($result){
            //$num += $result->num;
//            $this->db->set('did', $did);
//            $bool = $this->db->insert('cart');
            $sql = "Select num from cart where did=$did";
            $originalStr = $this->db->query($sql)->row();
            //echo $original;
            $original = $originalStr->num;
            $totalNum = (int)$original + $num;
            $data = array(
                'num' => $totalNum,
            );
            $this->db->where('did', $did);
            $bool = $this->db->update('cart', $data);
            //$bool = $this->db->update('cart',$totalNum, array('did' => $did));
            if ($bool) {
                $arr = array('flag' => 'success');
                echo json_encode($arr);
            } else {
                $arr = array('flag' => 'error');
                echo json_encode($arr);
            }

        }else{
            $data = array(
                'did' => $did,
                'dname' => $dname,
                'price' => $price,
                'num' => $num,
                'uid' => $uid
            );
            $bool = $this->db->insert('cart', $data);
            if ($bool) {
                $arr = array('flag' => 'success');
                echo json_encode($arr);
            } else {
                $arr = array('flag' => 'error');
                echo json_encode($arr);
            }
        }
    }

}