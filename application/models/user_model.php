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
    //插入或更新购物车
    public function insert_card($did,$dname,$price,$num,$uid){
        $result = $this->db->get_where('cart', array('did' => $did,'uid' =>$uid))->row();
        if($result){
            $sql = "Select num from cart where did=$did AND uid=$uid";
            $originalStr = $this->db->query($sql)->row();
            //echo $original;
            $original = $originalStr->num;
            $totalNum = (int)$original + $num;
            $data = array(
                'num' => $totalNum,
            );
            $where = "did = $did AND uid = $uid";
            $str = $this->db->update_string('cart', $data, $where);
            //相当于 UPDATE cart SET num=$num WHERE did = $did AND uid = $uid
            $bool = $this->db->query($str);
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
    //更新购物车商品数量
    public function update_card($did,$num,$uid){
        $data = array(
            'num' => $num,
        );
        $where = "did = $did AND uid = $uid";
        $str = $this->db->update_string('cart', $data, $where);
        //相当于 UPDATE cart SET num=$num WHERE did = $did AND uid = $uid
        $bool = $this->db->query($str);
        if ($bool) {
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'error');
            echo json_encode($arr);
        }

    }
    //删除购物车某条记录
    public function delete_card_by_id($id){
        $bool = $this->db->delete('cart', array('id' => $id));
        if ($bool) {
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'error');
            echo json_encode($arr);
        }
    }
    //插入收货信息
    public function insert_receipt_info($name,$phone,$address,$uid){
        $data = array(
            'name' => $name,
            'phone' => $phone,
            'address' => $address,
            'uid' => $uid
        );
        $bool = $this->db->insert('receipt', $data);
        if ($bool) {
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'error');
            echo json_encode($arr);
        }
    }
    //获取收货信息
    public function get_address_info($uid){
        $result = $this->db->get_where('receipt',array('uid' => $uid)) ->result();
        if($result){
            echo json_encode($result);
        } else {
            $arr = array('flag' => 'empty');
            echo json_encode($arr);
        }

    }
    //更新收货信息
    public function update_address_info($id,$uid,$name,$phone,$address){
        $data = array(
            'name' => $name,
            'phone' => $phone,
            'address' => $address,
        );
        $where = "id = $id AND uid = $uid";
        $str = $this->db->update_string('receipt', $data, $where);
        //相当于 UPDATE cart SET num=$num WHERE did = $did AND uid = $uid
        $bool = $this->db->query($str);
        if ($bool) {
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'error');
            echo json_encode($arr);
        }
    }
    //删除收货地址
    public function delete_address_info($id,$uid){
        $bool = $this->db->delete('receipt', array('id' => $id,'uid' => $uid));
        if ($bool) {
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'error');
            echo json_encode($arr);
        }
    }
    //下单后操作
    public function place_an_order($time,$name,$phone,$total,$address,$uid,$data){
        $arr = array(
            'time' => $time,
            'phone' => $phone,
            'address' => $address,
            'name' => $name,
            'total' => $total,
            'uid' => $uid
        );
        //插入订单表
        $bool1 = $this->db->insert('order', $arr);
        if($bool1){
            $dataArr = array();
            for($i = 0; $i < sizeof($data); $i++){
                $arr = array();
                foreach($data[$i] as $key => $val){
                    $arr[$key] = $val;
                }
                array_push($dataArr,$arr);
            }
            //插入订单详情表
            $bool2 = $this->db->insert_batch('order_detail', $dataArr);
            if($bool2){
                //下单后删除该用户购物车信息
                $bool3 = $this->db->delete('cart', array('uid' => $uid));
                if($bool3){
                    echo json_encode(array('flag'=>"success"));
                }else{
                    echo json_encode(array('flag'=>"error"));
                }
            }else{
                echo json_encode(array('flag'=>"error"));
            }
        }else{
            echo json_encode(array('flag'=>"error"));
        }

    }
    //获取订单信息
    public function get_order($uid){
        $result = $this->db->get_where('order',array('uid' => $uid)) ->result();
        if($result){
            echo json_encode($result);
        } else {
            $arr = array('flag' => 'empty');
            echo json_encode($arr);
        }

    }
    //获取订单信息
    public function get_order_detail($uid,$time){
        $result = $this->db->get_where('order_detail',array('uid' => $uid,'time' => $time)) ->result();
        if($result){
            echo json_encode($result);
        } else {
            $arr = array('flag' => 'empty');
            echo json_encode($arr);
        }

    }
    //插入评论
    public function add_comment($uid,$name,$did,$comment,$distribution,$packing,$taste){
        $data = array('uid' => $uid,'name' => $name,'did' => $did, 'comment' => $comment,'distribution' => $distribution,'packing' => $packing,'taste' => $taste );
        $result = $this->db->insert('comment',$data);
        if($result){
            $arr = array('flag' => 'success');
            echo json_encode($arr);
        } else {
            $arr = array('flag' => 'empty');
            echo json_encode($arr);
        }

    }

}