package com.ly.controller;

import com.ly.pojo.Figure;
import com.ly.pojo.Order;
import com.ly.pojo.Refund;
import com.ly.service.Figure.FigureService;
import com.ly.service.Order.OrderService;
import com.ly.service.Refund.RefundService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class AdminOrderFunctionController {
    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;
    @Autowired
    @Qualifier("RefundServiceImpl")
    private RefundService refundService;
    @Autowired
    @Qualifier("FigureServiceImpl")
    private FigureService figureService;

    //去管理员查看所有订单
    @RequestMapping("/toAdminShowAllOrderSP")
    public String toAdminShowAllOrderSP(Model model, int startPlace){
        int pageSize=4;
        int evaluateCount=orderService.queryOrderCount();
        int allPage=0;
        System.out.println(evaluateCount%pageSize);
        //计算所有页码
        if(evaluateCount%pageSize==0){
            allPage=evaluateCount/pageSize;
        }
        else if(evaluateCount%pageSize!=0){
            allPage=(evaluateCount/pageSize)+1;
        }
        if(startPlace<=0){
            startPlace=0;
        }
        else if(startPlace>=evaluateCount){
            startPlace=allPage*pageSize-2;
        }
        int nowPage=(startPlace/pageSize)+1;
        List<Order> orders=orderService.queryAllOrderSP(startPlace,pageSize);
        model.addAttribute("adminAllOrder",orders);
        model.addAttribute("nowPage",nowPage);
        model.addAttribute("allPage",allPage);
        model.addAttribute("pageSize",pageSize);

        System.out.println("evaluateCount"+evaluateCount);
        System.out.println("startplace="+startPlace);
        System.out.println("nowPage"+nowPage);
        System.out.println("allPage"+allPage);
        return "AdminOrderFunction/AdminShowAllOrder";
    }
    //去管理员确认发货订单
    @RequestMapping("/AdmingetDeliveryStatus/{orderId}")
    @ResponseBody
    public String AdmingetDeliveryStatus(@PathVariable("orderId") String orderId, @RequestParam("trackingBelong") String trackingBelong,@RequestParam("trackingNumber") String trackingNumber, Model model,@RequestParam("nowPage") int nowPage,@RequestParam("allPage") int allPage,@RequestParam("pageSize") int pageSize){
        System.out.println("***********orderID"+orderId);
        int evaluateCount=orderService.queryOrderCount();
        System.out.println("evaluateCount"+evaluateCount);

//        orderService.AdminDeliveryStatus(orderId);
        List<Order> AdminOrder=orderService.queryOrderByOrderId(orderId);
        Object items[]=AdminOrder.toArray();
        for (int i=0;i<items.length;i++){
            Order temp=(Order) items[i];
            temp.setOrderId(orderId);
            temp.setTrackingBelong(trackingBelong);
            temp.setTrackingNumber(trackingNumber);
            System.out.println("--------------"+temp);
            orderService.AdminDeliveryStatus(temp);
            System.out.println("++++++++++++++++"+temp);
            break;
        }
//        orderService.AdminDeliveryStatus(AdminOrder);
        List<Order> orders=orderService.queryAllOrderSP((nowPage-1)*pageSize,pageSize);
        model.addAttribute("adminAllOrder",orders);
        model.addAttribute("nowPage",nowPage);
        model.addAttribute("allPage",allPage);
        model.addAttribute("pageSize",pageSize);
        return "{\"result\":\"success\"}";
//        return "AdminOrderFunction/AdminShowAllOrder";
    }
    //管理员去查看所有订单申请（如取消订单进行退款、退货、换货）
    @RequestMapping("/AdminShowAllRefund")
    public String AdminShowAllRefund(Model model, HttpSession session){
        List<Refund> refunds=refundService.queryAllRefund();
        model.addAttribute("AdminAllRefund",refunds);
        System.out.println(refunds);
        return "AdminOrderFunction/AdminShowAllRefund";
    }
    //管理员同意处理
    @RequestMapping("/AdminAgreeRefund/{orderId}")
    public String AdminAgreeRefund(@PathVariable("orderId")String orderId){
        Refund refund= refundService.queryRefundByOrderId(orderId);
        if (refund.getRefundType().equals("取消订单")){
            orderService.updateIsrefundprocess(orderId);
            refundService.AdminUpdateApplyOrder(orderId);
            orderService.deleteOrderById(orderId);
        }
        else if (refund.getRefundType().equals("换货")){
            refundService.AdminUpdateApplyOrder(orderId);
        }
        else{
//            List<Order> AdminOrder=orderService.queryOrderByOrderId(orderId);
//            Object items[]=AdminOrder.toArray();
//            for (int i=0;i<items.length;i++){
//                Order temp=(Order) items[i];
//                temp.setFulladdress(refund.getRefundReason());
//                System.out.println("--------------"+temp);
//                orderService.updateOrderFulladdress(temp);
//                System.out.println("++++++++++++++++"+temp);
//                break;
//            }
            orderService.updateOrderFulladdress(refund);
            refundService.AdminUpdateApplyOrder(orderId);
        }
//        refundService.deleteRefund(orderId);
        return "redirect:/AdminShowAllRefund";
    }
    //管理员取消处理
    @RequestMapping("/AdminDisagreeRefund/{orderId}")
    public String AdminDisagreeRefund(@PathVariable("orderId")String orderId){
        refundService.AdminReduceApplyOrder(orderId);
//        refundService.deleteRefund(orderId);
        return "redirect:/AdminShowAllRefund";
    }
    //管理员去报表页面，查看各个手办的销售情况
    @RequestMapping("/toAdminShowFigureReportForms")
    public String toAdminShowFigureReportForms(Model model,HttpSession session) throws ParseException {
        List<Figure> figureList= figureService.allrenzheFigure();
        session.setAttribute("allrenzheFigureList",figureList);
        session.setAttribute("DaysAllrenzheFigureList",null);
        model.addAttribute("allrenzheFigureList",figureList);
        return "AdminOrderFunction/AdminShowFigureReportForms";
    }
    //管理员去报表页面，查看“当日”各个手办的销售情况
    @RequestMapping("/toAdminShowFigureReportFormsToday")
    public String toAdminShowFigureReportFormsToday(Model model, @Param("days") Date days,HttpSession session) throws ParseException {
        Calendar calendar1 = Calendar.getInstance();
        calendar1.set(Calendar.DATE, calendar1.get(Calendar.DATE) - 1);
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd 00:00:00");
        format.parse(format.format(calendar1.getTime()));
        model.addAttribute("days",calendar1.getTime());
        System.out.println("+++++++++++++++++++++++++++"+calendar1.getTime());

        days=(Date) model.getAttribute("days");
        List<Order> orderList=figureService.toAdminShowFigureReportFormsToday(days);
        Object items[]=orderList.toArray();
//        int[] figureId=new int[100];
//        for (int i=0;i<items.length;i++){
//            Order temp=(Order) items[i];
//            if (figureId==null){
//                figureId[0]=temp.getFigureId();
//            }
//            else {
//                int k=1;
//                for (int j=0;j<figureId.length;j++){
//                    if (figureId[j]==temp.getFigureId()) k=0;
//                }
//                if (k==1) figureId[figureId.length]=temp.getFigureId();
//            }
//        }
        ArrayList<Integer> figureId=new ArrayList<Integer>();
//        Object figureIdItems[]=figureId.toArray();
        for (int i=0;i<items.length;i++){
            Order temp=(Order) items[i];
//            figureIdItems=figureId.toArray();
//            Integer Idtemp2=(Integer) figureIdItems[i];
            if (figureId==null){
                figureId.add(temp.getFigureId());
            }
            else {
                int k=1;
                for (int j=0;j<figureId.size();j++){
                    if (figureId.get(j)==temp.getFigureId()) k=0;
                }
                if (k==1) figureId.add(temp.getFigureId());
//                if (k==1) figureId.set(figureId.size(),temp.getFigureId());
            }
        }
        System.out.println("++++++++++++++++"+figureId);
        int figureQuantity=0;double price=0;
        ArrayList<Figure> figureReportFormsList=new ArrayList<Figure>();
        for (int i=0;i<figureId.size();i++){
            for (int j=0;j<items.length;j++){
                Order temp=(Order) items[j];
                if (figureId.get(i)==temp.getFigureId())
                {
                    figureQuantity=figureQuantity+temp.getFigureQuantity();
                    price=price+temp.getPrice();
                    System.out.println("--------------"+figureQuantity);
                    System.out.println("++++++++++++++++"+price);
                }
            }
            Figure figure=figureService.queryrenzheFigureById(figureId.get(i));
            System.out.println("-------------------ID："+figureId.get(i)+"      数量："+figureQuantity);
            figure.setFigureSales(figureQuantity);
            figureReportFormsList.add(figure);
            figureQuantity=0;price=0;
        }
        session.setAttribute("DaysAllrenzheFigureList",figureReportFormsList);
        session.setAttribute("allrenzheFigureList",null);
        model.addAttribute("DaysAllrenzheFigureList",figureReportFormsList);
//        model.addAttribute("DaysAllrenzheFigureList",orderList);

//        Calendar calendar1 = Calendar.getInstance();
//        Calendar calendar2 = Calendar.getInstance();
//        Calendar calendar3 = Calendar.getInstance();

//        calendar1.set(Calendar.DATE, calendar1.get(Calendar.DATE) - 1);
//        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd 00:00:00");
//        format.parse(format.format(calendar1.getTime()));
//        model.addAttribute("1days",calendar1.getTime());
//        System.out.println("+++++++++++++++++++++++++++"+calendar1.getTime());

//        calendar2.set(Calendar.DATE, calendar2.get(Calendar.DATE) - 7);
//        model.addAttribute("7days",calendar2.getTime());
//        System.out.println("+++++++++++++++++++++++++++"+calendar2.getTime());
//
//        calendar3.set(Calendar.DATE, calendar3.get(Calendar.DATE) - 30);
//        model.addAttribute("30days",calendar3.getTime());
//        System.out.println("+++++++++++++++++++++++++++"+calendar3.getTime());
        return "AdminOrderFunction/AdminReportFormsBelong";
    }
    //管理员去报表页面，根据jsp页面传递过来的“jspDays”，即天数，从而各个手办的销售情况
    @RequestMapping("/toAdminShowFigureReportFormsDays")
    public String toAdminShowFigureReportFormsDays(Model model, @Param("days") Date days,int jspDays,HttpSession session){
        Calendar calendar2 = Calendar.getInstance();
//        calendar2.set(Calendar.DATE, calendar2.get(Calendar.DATE) - 7);
        calendar2.set(Calendar.DATE, calendar2.get(Calendar.DATE) - jspDays);
        model.addAttribute("days",calendar2.getTime());
        System.out.println("+++++++++++++++++++++++++++"+calendar2.getTime());

        days=(Date) model.getAttribute("days");
        List<Order> orderList=figureService.toAdminShowFigureReportFormsDays(days);
        Object items[]=orderList.toArray();

        ArrayList<Integer> figureId=new ArrayList<Integer>();
        for (int i=0;i<items.length;i++){
            Order temp=(Order) items[i];
            if (figureId==null){
                figureId.add(temp.getFigureId());
            }
            else {
                int k=1;
                for (int j=0;j<figureId.size();j++){
                    if (figureId.get(j)==temp.getFigureId()) k=0;
                }
                if (k==1) figureId.add(temp.getFigureId());
            }
        }
        System.out.println("++++++++++++++++"+figureId);
        int figureQuantity=0;double price=0;
        ArrayList<Figure> figureReportFormsList=new ArrayList<Figure>();
        for (int i=0;i<figureId.size();i++){
            for (int j=0;j<items.length;j++){
                Order temp=(Order) items[j];
                if (figureId.get(i)==temp.getFigureId())
                {
                    figureQuantity=figureQuantity+temp.getFigureQuantity();
                    price=price+temp.getPrice();
                }
            }
            Figure figure=figureService.queryrenzheFigureById(figureId.get(i));
            figure.setFigureSales(figureQuantity);
            figureReportFormsList.add(figure);
            figureQuantity=0;price=0;
        }
        session.setAttribute("DaysAllrenzheFigureList",figureReportFormsList);
        session.setAttribute("allrenzheFigureList",null);
        model.addAttribute("DaysAllrenzheFigureList",figureReportFormsList);
        return "AdminOrderFunction/AdminReportFormsBelong";
    }
    //管理员去报表页面，点击“销售量升序”，将当前页面的数据进行排序
    @RequestMapping("/toAdminShowFigureReportFormsSalesUp")
    public String toAdminShowFigureReportFormsSalesUp(Model model, HttpSession session){
        ArrayList<Figure> figureReportFormsList=new ArrayList<Figure>();
        if (session.getAttribute("allrenzheFigureList")!=null){
            figureReportFormsList=(ArrayList<Figure>) session.getAttribute("allrenzheFigureList");
            for (int i=0;i<figureReportFormsList.size()-1;i++){
                for (int j=i;j<figureReportFormsList.size();j++){
                    if (figureReportFormsList.get(i).getFigureSales()>figureReportFormsList.get(j).getFigureSales()){
                        Collections.swap(figureReportFormsList,i,j);
                    }
                }
            }
            session.setAttribute("allrenzheFigureList",figureReportFormsList);
            model.addAttribute("allrenzheFigureList",figureReportFormsList);
            return "AdminOrderFunction/AdminShowFigureReportForms";
        }
        if (session.getAttribute("DaysAllrenzheFigureList")!=null){
            figureReportFormsList=(ArrayList<Figure>) session.getAttribute("DaysAllrenzheFigureList");
            for (int i=0;i<figureReportFormsList.size()-1;i++){
                for (int j=i;j<figureReportFormsList.size();j++){
                    if (figureReportFormsList.get(i).getFigureSales()>figureReportFormsList.get(j).getFigureSales()){
                        Collections.swap(figureReportFormsList,i,j);
                    }
                }
            }
            session.setAttribute("DaysAllrenzheFigureList",figureReportFormsList);
            model.addAttribute("DaysAllrenzheFigureList",figureReportFormsList);
        }
        return "AdminOrderFunction/AdminReportFormsBelong";
    }
    //管理员去报表页面，点击“销售量降序”，将当前页面的数据进行排序
    @RequestMapping("/toAdminShowFigureReportFormsSalesDown")
    public String toAdminShowFigureReportFormsSalesDown(Model model, HttpSession session){
        ArrayList<Figure> figureReportFormsList=new ArrayList<Figure>();
        if (session.getAttribute("allrenzheFigureList")!=null){
            figureReportFormsList=(ArrayList<Figure>) session.getAttribute("allrenzheFigureList");
            for (int i=0;i<figureReportFormsList.size()-1;i++){
                for (int j=i;j<figureReportFormsList.size();j++){
                    if (figureReportFormsList.get(i).getFigureSales()<figureReportFormsList.get(j).getFigureSales()){
                        Collections.swap(figureReportFormsList,i,j);
                    }
                }
            }
            session.setAttribute("allrenzheFigureList",figureReportFormsList);
            model.addAttribute("allrenzheFigureList",figureReportFormsList);
            return "AdminOrderFunction/AdminShowFigureReportForms";
        }
        if (session.getAttribute("DaysAllrenzheFigureList")!=null){
            figureReportFormsList=(ArrayList<Figure>) session.getAttribute("DaysAllrenzheFigureList");
            for (int i=0;i<figureReportFormsList.size()-1;i++){
                for (int j=i;j<figureReportFormsList.size();j++){
                    if (figureReportFormsList.get(i).getFigureSales()<figureReportFormsList.get(j).getFigureSales()){
                        Collections.swap(figureReportFormsList,i,j);
                    }
                }
            }
            session.setAttribute("DaysAllrenzheFigureList",figureReportFormsList);
            model.addAttribute("DaysAllrenzheFigureList",figureReportFormsList);
        }
        return "AdminOrderFunction/AdminReportFormsBelong";
    }
    //管理员去报表页面，点击“销售额榜单”，将当前页面的数据进行排序(此方法为降序)
    @RequestMapping("/toAdminShowFigureReportFormsSalesPriceList")
    public String toAdminShowFigureReportFormsSalesPriceList(Model model, HttpSession session){
        ArrayList<Figure> figureReportFormsList=new ArrayList<Figure>();
        if (session.getAttribute("allrenzheFigureList")!=null){
            figureReportFormsList=(ArrayList<Figure>) session.getAttribute("allrenzheFigureList");
            for (int i=0;i<figureReportFormsList.size()-1;i++){
                for (int j=i;j<figureReportFormsList.size();j++){
                    if (figureReportFormsList.get(i).getFigureSales()*figureReportFormsList.get(i).getFigurePrice()
                            <figureReportFormsList.get(j).getFigureSales()*figureReportFormsList.get(j).getFigurePrice()){
                        Collections.swap(figureReportFormsList,i,j);
                    }
                }
            }
            session.setAttribute("allrenzheFigureList",figureReportFormsList);
            model.addAttribute("allrenzheFigureList",figureReportFormsList);
            return "AdminOrderFunction/AdminShowFigureReportForms";
        }
        if (session.getAttribute("DaysAllrenzheFigureList")!=null){
            figureReportFormsList=(ArrayList<Figure>) session.getAttribute("DaysAllrenzheFigureList");
            for (int i=0;i<figureReportFormsList.size()-1;i++){
                for (int j=i;j<figureReportFormsList.size();j++){
                    if (figureReportFormsList.get(i).getFigureSales()*figureReportFormsList.get(i).getFigurePrice()
                            <figureReportFormsList.get(j).getFigureSales()*figureReportFormsList.get(j).getFigurePrice()){
                        Collections.swap(figureReportFormsList,i,j);
                    }
                }
            }
            session.setAttribute("DaysAllrenzheFigureList",figureReportFormsList);
            model.addAttribute("DaysAllrenzheFigureList",figureReportFormsList);
        }
        return "AdminOrderFunction/AdminReportFormsBelong";
    }
}
