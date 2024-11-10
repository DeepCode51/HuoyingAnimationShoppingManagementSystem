package com.ly.controller;

import com.ly.interceptor.CartManager;
import com.ly.pojo.*;
import com.ly.service.Figure.FigureService;
import com.ly.service.Order.OrderService;
import com.ly.service.Refund.RefundService;
import com.ly.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class FigureController {
    @Autowired
    @Qualifier("FigureServiceImpl")
    private FigureService figureService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @RequestMapping("/toxiaozuzhiFigure")
    public String toxiaozuzhiFigure(Model model){
        List<Figure> figureList=figureService.xiaozuzhiFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "Figure/figure";
    }
    @RequestMapping("/tolidaihuoyingFigure")
    public String tolidaihuoyingFigure(Model model){
        List<Figure> figureList=figureService.lidaihuoyingFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "Figure/figure";
    }
    @RequestMapping("/torendaoqirenFigure")
    public String rendaoqirenFigure(Model model){
        List<Figure> figureList=figureService.rendaoqirenFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "Figure/figure";
    }
    @RequestMapping("/tobamendunjiaFigure")
    public String tobamendunjiaFigure(Model model){
        List<Figure> figureList=figureService.bamendunjiaFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "Figure/figure";
    }
    @RequestMapping("/toSalesSortFigure")
    public String toSalesSortFigure(Model model){
        List<Figure> figureList=figureService.SalesSort();
        model.addAttribute("allrenzheFigureList",figureList);
        return "Figure/figure";
    }
    @RequestMapping("/toAddFigure")
    public String toAddFigure(Model model){
        List<FigureBelong> figureBelongList=figureService.allFigureBelong();
        model.addAttribute("allFigureBelongList",figureBelongList);
        return "Figure/addFigure";
    }
    @RequestMapping(value = "/addFigure" ,method = RequestMethod.POST)
    public String addrenzhe(MultipartFile figureImg, HttpServletRequest request, Figure figure) throws IOException {
        //图片上传成功后，将图片的地址写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\figure";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = figureImg.getOriginalFilename();
        //新的文件名字
//        String newFileName = UUID.randomUUID()+originalFilename;
        //封装上传文件位置的全路径
//        File targetFile = new File(filePath,newFileName);
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                figureImg.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
//        File targetFile = new File(filePath,originalFilename);
//        //把本地文件上传到封装上传文件位置的全路径
//        renzheImg.transferTo(targetFile);
        //上传到数据库
        System.out.println("originalFilename="+originalFilename);
//        System.out.println("newFileName="+newFileName);
        figure.setFigureImage(originalFilename);
        figureService.addrenzheFigure(figure);
        return "redirect:/addFigure2";
    }
    //上面的addFigure做完后，调用这里的addFigure2重新进入手办页
    @RequestMapping("/addFigure2")
    public String  addFigure2(Model model,Figure figure){
        List<Figure> figureList=figureService.allrenzheFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "AdminNew/AdminFigure";
//        return "Figure/figure";
    }
    @RequestMapping("/toUpdateFigure")
    public String toUpdateFigure(Model model,int id){
        Figure figure=figureService.queryrenzheFigureById(id);
        model.addAttribute("updateFigure",figure);

        List<FigureBelong> figureBelongList=figureService.allFigureBelong();
        model.addAttribute("allFigureBelongList",figureBelongList);
        return "Figure/updateFigure";
    }
    @RequestMapping("/updateFigure")
    public String updateFigure(MultipartFile figureImg, Figure figure) throws IOException {
        //图片上传成功后，将图片的地址写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\figure";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = figureImg.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                figureImg.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
//        File targetFile = new File(filePath,originalFilename);
//        //把本地文件上传到封装上传文件位置的全路径
//        renzheImg.transferTo(targetFile);
        //上传到数据库
        System.out.println("originalFilename="+originalFilename);
        figure.setFigureImage(originalFilename);
        figureService.updaterenzheFigure(figure);
        return "redirect:/toAdminFigure";
//        return "redirect:/toFigure";
    }
    @RequestMapping("/deleteFigureById/{figureId}")
    public String deleteFigureById(@PathVariable("figureId") int id){
        figureService.deleterenzheFigureById(id);
        return "redirect:/toAdminFigure";
    }
    //用户将商品加入购物车
    @RequestMapping("/addtoCart.do/{figureId}")
    public String addtoCart(@PathVariable("figureId") int figureId, HttpSession session){
        Figure figure=figureService.queryrenzheFigureById(figureId);
        System.out.println(figure);
        System.out.println(session.getAttribute("cart"));
        CartManager cartManager=new CartManager();
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        cartManager.setCart(cart);
        cartManager.addToCart(figure,1);
        session.setAttribute("cart",cartManager.getCart());
        return "redirect:/toCart";
    }
    @RequestMapping("/toCart")
    public String toCart(Model model){
        return "Figure/cart";
    }
    //用户修改购物车中商品购买的数量
    @RequestMapping("/ModifyCart")
    public String ModifyCart(Model model,HttpSession session,String action,int figureId,int quantity){
        CartManager cartManager=new CartManager();
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        cartManager.setCart(cart);
        if("修改".equals(action)){
            cartManager.update(figureId,quantity);
        }else{
            cartManager.delete(figureId);
        }
        session.setAttribute("cart",cartManager.getCart());
        return "Figure/cart";
    }
    //清空购物车
    @RequestMapping("/clearCart")
    public String clearCart(HttpSession session){
        session.setAttribute("cart",null);
        return "Figure/cart";
    }
    //去购物车信息确认页面
    @RequestMapping("/makeSureCart")
    public String makeSureCart(HttpSession session,Model model){
        User user=(User)session.getAttribute("loginSession");
//        String uaddress = userService.queryUserAddress(uid);
//        if(null==uaddress){
//            return "User/userAddress";
//        }
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        Object items[]=cart.toArray();

        DecimalFormat df = new DecimalFormat("0.00");
//        double d = 3.1415;
//        String db = df.format(d);
//        System.out.println(db);
        float sum=0;
        for(int j=0;j<items.length;j++){
            ItemBean temp=(ItemBean)items[j];
            sum=sum+Float.parseFloat(df.format(temp.getFigure().getFigurePrice()*temp.getQuantity()));
//            int goodprice= (int) temp.getFigure().getFigurePrice();
//            int goodnumber=temp.getQuantity();;
//            sum=sum+goodprice*goodnumber;
        }
        model.addAttribute("user",user);
        model.addAttribute("sum",sum);
        return "Figure/FinishCart";
    }
    //去订单支付页面
    @RequestMapping("/toOrderPay")
    public String toOrderPay(String sum, Model model, HttpSession session, User user){
        model.addAttribute("orderInfo",user);
        model.addAttribute("sum",sum);
        return "Figure/OrderPay";
    }
    //支付订单
    @RequestMapping("/orderPay")
    public String orderPay(Order order, Model model, HttpSession session){
        Date day=new Date();
        //格式化成yyyyMMdd格式，注意大小写
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String payTime=format.format(day);
        String now=(String)(payTime.toString());  //当前的日期时间

        int count = orderService.queryOrderCount();
        String str_i=String.valueOf(count); //转成字符串格式
        while(str_i.length()<3){	//格式化成三位的字符串
            str_i="0"+str_i;
        }
        String orderid=now+str_i;
        orderid=orderid.replace("-","");	//将日期格式中的特别符号（空格等）除去
        orderid=orderid.replace(" ","");
        orderid=orderid.replace(":","");
        System.out.println(orderid);

        //给订单设置值
        order.setIsevaluate("false");
        order.setIsreceive("false");
        order.setIsrefundprocess("false");
        order.setIfSubmitRefund("false");
        order.setPayTime(payTime);
        order.setDeliveryStatus("未发货");
        User user=(User)session.getAttribute("loginSession");
        int userid=user.getUserid();
        order.setUserid(user.getUserid());
//        order.setUserid((int) user.getUserid());
//        order.setUserid((int) session.getAttribute("uid"));
        model.addAttribute("user",user);

        String boid="";
        ArrayList cart=(ArrayList)session.getAttribute("cart");
        Object items[]=cart.toArray();
        for(int j=0;j<items.length;j++){
            ItemBean temp=(ItemBean)items[j];
//            boid=orderid+j;
//            order.setOrderId(boid);
            order.setOrderId(orderid);
            order.setFigureId(temp.getFigure().getFigureId());
            order.setFigureName(temp.getFigure().getFigureName());
            order.setFigureQuantity(temp.getQuantity());

            DecimalFormat df = new DecimalFormat("0.00");
            order.setPrice(Double.parseDouble(df.format(temp.getFigure().getFigurePrice()*temp.getQuantity())));
//            order.setPrice((int) (temp.getQuantity()*temp.getFigure().getFigurePrice()));
            System.out.println(boid);
            System.out.println(order);
            orderService.addFigureOrder(order);
            figureService.addFigureSales(temp.getFigure().getFigureId(),temp.getQuantity());
        }
        session.setAttribute("cart",null);
        return "Figure/cart";
    }
    //去我的订单页面
    @RequestMapping("/toUserOrder")
    public String toUserOrder(Model model, HttpSession session, String vcheck){
        HashMap map = new HashMap();
        if("1".equals(vcheck)){
            System.out.println("vcheck="+vcheck);
            map.put("isreceive","false");
        }
        else if("2".equals(vcheck)){
            System.out.println("vcheck="+vcheck);
            map.put("isevaluate","false");
            map.put("isreceive","true");
        }
        else if("3".equals(vcheck)){
            System.out.println("vcheck="+vcheck);
            map.put("isevaluate","true");
        }
        System.out.println(vcheck);
        User user=(User)session.getAttribute("loginSession");
        int userid=user.getUserid();
        map.put("userid",userid);
        List<Order> orders = orderService.queryUserOrder(map);
        System.out.println(orders);
        model.addAttribute("orders",orders);
        model.addAttribute("vcheck",vcheck);
        return "Figure/UserOrder";
    }

}
