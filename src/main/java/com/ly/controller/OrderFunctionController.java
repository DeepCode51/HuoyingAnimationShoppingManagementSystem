package com.ly.controller;

import com.ly.pojo.*;
import com.ly.service.Figure.FigureService;
import com.ly.service.Order.OrderService;
import com.ly.service.OrderEvaluate.OrderEvaluateService;
import com.ly.service.Refund.RefundService;
import com.ly.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class OrderFunctionController {
    @Autowired
    @Qualifier("FigureServiceImpl")
    private FigureService figureService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;
    @Autowired
    @Qualifier("OrderEvaluateServiceImpl")
    private OrderEvaluateService orderEvaluateService;
    @Autowired
    @Qualifier("RefundServiceImpl")
    private RefundService refundService;

    //用户确认收货
    @RequestMapping("/receiveMakeSure/{orderId}")
    public String receiveMakeSure(@PathVariable("orderId") String orderId){
        System.out.println(orderId);
        orderService.updateIsreceive(orderId);
        return "redirect:/toUserOrder";
    }
    //用户去订单评论页面（过渡）
    @RequestMapping("/toFigureOrderEvaluate/{orderId}")
    public String toFigureOrderEvaluate(@PathVariable("orderId")String orderId, Model model, HttpSession session){
        model.addAttribute("orderId",orderId);
        session.setAttribute("orderId",orderId);
        System.out.println(model.getAttribute("orderId"));
        return "redirect:/toFigureOrderEvaluate2";
//        return "OrderFunction/UseAddOrderEvaluate";
    }
    //用户去订单评论页面（真正到订单评论页面）
    @RequestMapping("/toFigureOrderEvaluate2")
    public String toFigureOrderEvaluate2(Model model,HttpSession session){
//        model.addAttribute("orderId",orderId);
        System.out.println(session.getAttribute("orderId"));
        model.addAttribute("orderId",session.getAttribute("orderId"));
//        System.out.println(model.getAttribute("orderId"));
        return "OrderFunction/UserAddOrderEvaluate";
    }
    //用户提交评价
    @RequestMapping("/addOrderEvaluate")
    public String addOrderEvaluate(FigureOrderEvaluate figureOrderEvaluate, MultipartFile evaluateRsc) throws IOException {
        System.out.println(figureOrderEvaluate);
        List<Order> order=orderService.queryOrderByOrderId(figureOrderEvaluate.getOrderId());
//        Order order=orderService.queryOrderByOrderId(figureOrderEvaluate.getOrderId());

        //提交评价时间
        Date day=new Date();
        //格式化成yyyyMMdd格式，注意大小写
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String evaluateTime=format.format(day);

        Object items[]=order.toArray();
        for (int i=0;i<items.length;i++){
            Order temp=(Order) items[i];
            figureOrderEvaluate.setUserid(temp.getUserid());
            figureOrderEvaluate.setUsername(temp.getUsername());
//            figureOrderEvaluate.setFigureId(temp.getFigureId());
//            figureOrderEvaluate.setFigureName(temp.getFigureName());
            figureOrderEvaluate.setEvaluateTime(evaluateTime);
            break;
        }

//        figureOrderEvaluate.setUserid(order.getUserid());
//        figureOrderEvaluate.setUsername(order.getUsername());
//        figureOrderEvaluate.setFigureId(order.getFigureId());
//        figureOrderEvaluate.setFigureName(order.getFigureName());
////        figureOrderEvaluate.setFigureName(figureService.q);
//        figureOrderEvaluate.setEvaluateTime(evaluateTime);

        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\figureOrderEvaluate";//保存订单评论的手办图片的路径
//        String filePath = "D:\\learn\\Java learn\\bookSaleSSM\\web\\statics\\bookEvaluate";//保存订单评论的手办图片的路径
        String originalFilename = evaluateRsc.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                evaluateRsc.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
            figureOrderEvaluate.setFigureImage(originalFilename);
        }
        System.out.println(figureOrderEvaluate);
        orderEvaluateService.addFigureEvaluate(figureOrderEvaluate);
        orderService.updateIsevaluate(figureOrderEvaluate.getOrderId());
        return "redirect:/toUserOrder";
    }
    //用户查看自己的订单评价（过渡一下）
    @RequestMapping("/showUserEvaluate/{orderId}")
    public String showUserEvaluate(@PathVariable("orderId")String orderId, Model model,HttpSession session){
        FigureOrderEvaluate figureOrderEvaluate=orderEvaluateService.queryEvaluateByOrderId(orderId);
        session.setAttribute("figureOrderEvaluate",figureOrderEvaluate);
        return "redirect:/showUserEvaluate2";
    }
    //用户查看自己的订单评价（真正查看用户自己的订单评价）
    @RequestMapping("/showUserEvaluate2")
    public String showUserEvaluate2(Model model,HttpSession session){
        model.addAttribute("figureOrderEvaluate",session.getAttribute("figureOrderEvaluate"));
        return "OrderFunction/ShowUserEvaluate";
    }
    //用户删除评价
    @RequestMapping("/deleteUserEvaluate/{orderId}")
    public String deleteUserEvaluate(@PathVariable("orderId")String orderId, Model model,HttpSession session){
        orderEvaluateService.deleteEvaluateByOrderId(orderId);
        FigureOrderEvaluate figureOrderEvaluate=orderEvaluateService.queryEvaluateByOrderId(orderId);
        session.setAttribute("figureOrderEvaluate",figureOrderEvaluate);
//        model.addAttribute("figureOrderEvaluate",figureOrderEvaluate);
        return "redirect:/showUserEvaluate2";
//        return "BookEvaluate/showUserEvaluate";
    }
    //用户去申请处理页面（过渡）
    @RequestMapping("/toAddFigureRefund/{orderId}")
    public String toAddBookRefund(@PathVariable("orderId") String orderId, Model model,HttpSession session){
        Refund refund=refundService.queryRefundByOrderId(orderId);
        if(refund!=null){
            session.setAttribute("UserRefundSubmit","申请已提交");
        }
        session.setAttribute("orderId",orderId);
        return "redirect:/toAddFigureRefund2";
    }
    //用户去申请处理页面（真正到用户申请处理界面）
    @RequestMapping("/toAddFigureRefund2")
    public String toAddBookRefund2( Model model,HttpSession session){
        Refund refund=refundService.queryRefundByOrderId((String) session.getAttribute("orderId"));
        if(refund!=null){
            model.addAttribute(session.getAttribute("UserRefundSubmit"));
        }
        List<Order> order=orderService.queryOrderByOrderId((String) session.getAttribute("orderId"));
        Object items[]=order.toArray();
        for (int i=0;i<items.length;i++){
            Order temp=(Order) items[i];
            model.addAttribute("UserIsreceive",temp.getIsreceive());
            break;
        }
        model.addAttribute(session.getAttribute("orderId"));
        return "OrderFunction/UserAddFigureRefund";
    }
    //用户提交处理
    @RequestMapping("/addFigureRefund")
    public String addFigureRefund(Refund refund, Order order,MultipartFile refundRsc) throws IOException {
        System.out.println(refund);
        //提交评价时间
        Date day=new Date();
        //格式化成yyyyMMdd格式，注意大小写
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String rdate=format.format(day);

        refund.setRefundTime(rdate);
        List<Order> orders=orderService.queryOrderByOrderId(order.getOrderId());
//        order=orderService.queryOrderByOrderId(order.getOrderId());

        Object items[]=orders.toArray();
        for (int i=0;i<items.length;i++){
            Order temp=(Order) items[i];
            refund.setUserid(temp.getUserid());
            refund.setUsername(temp.getUsername());
//            refund.setFigureId(order.getFigureId());
//            refund.setFigureName(order.getFigureName());
            break;
        }

//        refund.setUserid(order.getUserid());
//        refund.setUsername(order.getUsername());
//        refund.setFigureId(order.getFigureId());
//        refund.setFigureName(order.getFigureName());

        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\refund";//保存用户申请处理的图片的路径
        String originalFilename = refundRsc.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                refundRsc.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
            refund.setFigureImage(originalFilename);
        }
        System.out.println(refund);
        refundService.addFigureRefund(refund);
        return "redirect:/toUserOrder";
    }
    //用户通过点击售后审核状态页面，查询自己订单请求的审核进度
    @RequestMapping("/toUserShowApplyOrder")
    public String toUserShowApplyOrder(Model model,HttpSession session){
        User user=(User) session.getAttribute("loginSession");
        List<Refund> refundList=refundService.UserQueryApplyOrderByUserid(user.getUserid());
        model.addAttribute("UserShowAllOrderApply",refundList);
        return "OrderFunction/UserShowApplyOrder";
    }
    //用户点击我的订单，查看以时间进行分组的订单，有需求可以点击后面的“查看订单详情”则可以查看该时间订单的所有商品购买
//    @RequestMapping("/toUserOrderDateGroup")
//    public String toUserOrderDateGroup(Model model, HttpSession session, String vcheck){
//        HashMap map = new HashMap();
//        User user=(User)session.getAttribute("loginSession");
//        int userid=user.getUserid();
//        map.put("userid",userid);
//        List<Order> orders = orderService.queryUserOrderDateGroup(map);
//        System.out.println(orders);
//        model.addAttribute("orders",orders);
//        return "Figure/UserOrderDateGroup";
//    }
}
