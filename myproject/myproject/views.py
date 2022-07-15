from django.shortcuts import render

# Create your views here.

import base64
import time
import os
from django.http import HttpResponse, JsonResponse, HttpRequest
from django.shortcuts import render
from django.template.defaulttags import now
from django.template.loader import get_template
import datetime
import pymysql
import json


# def home(request):
#     return render(request, "Login.html")


# 按登录按钮后服务端获取用户的用户名和密码，并将登录记录录入数据库
def login(request):
    flag = 0  # 账号密码都不对
    # 获取从客户端输入的用户名和密码
    c_id = request.POST['c_id']
    password = request.POST['password']

    if c_id == '666666' and password == 'cky666':
        flag = 2
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()

    # SQL 查询语句
    cursor.execute("SELECT C_ID, C_PASSWORD FROM cky_customer")
    data = fetchJson(cursor)
    print(data)
    for i in range(data.__len__()):
        if c_id == str(data[i]['C_ID']) and password == data[i]['C_PASSWORD']:
            flag = 1  # 客户登录
    # 关闭数据库连接
    db.close()
    return JsonResponse(flag, safe=False)


# 将注册的信息传入数据库
def register_ind(request):
    flag1 = False
    flag2 = False
    print('saving sign up info')
    first_name = request.POST['first_name']
    middle_name = request.POST['middle_name']
    last_name = request.POST['last_name']
    password = request.POST['password']
    phone = request.POST['phone']
    email = request.POST['email']
    dln = request.POST['dln']
    icn = request.POST['icn']
    ipn = request.POST['ipn']
    street = request.POST['street']
    city = request.POST['city']
    state = request.POST['state']
    zipcode = request.POST['zipcode']

    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()

    cursor.execute("select COUNT(C_ID) from cky_customer")
    data = fetchJson(cursor)
    c_id = data[0]['COUNT(C_ID)'] + 1
    result = {
        'c_id': str(c_id),
    }
    # SQL 插入语句
    sql = "INSERT INTO cky_customer(`C_ID`,`C_TYPE`,`C_STREET`, `C_CITY`, `C_STATE`, `C_ZIPCODE`, `C_EMAIL`, `C_PHONE_NUM`, " \
          "`C_PASSWORD`) VALUES ('%d','%s', '%s', '%s', '%s', '%s','%s', '%s', '%s')" % (
              c_id, "I", street, city, state, zipcode, email, phone, password)
    sql2 = "INSERT INTO cky_individual(`C_ID`,`C_TYPE`,`F_NAME`, `M_NAME`, `L_NAME`, `DLN`, `INSURANCE_CNAME`, " \
           "`INSURANCE_PNUM`) VALUES ('%d','%s', '%s', '%s', '%s', '%s','%s', '%s')" % (
               c_id, "I", first_name, middle_name, last_name, dln, icn, ipn)
    print('SQL inserted')
    try:
        # 执行sql语句
        flag1 = True if cursor.execute(sql) == 1 else False
        flag2 = True if cursor.execute(sql2) == 1 else False

        # 执行sql语句
        db.commit()
    except Exception as ex:
        # 发生错误时回滚
        db.rollback()
        print(ex)

    # 关闭数据库连接
    db.close()
    return JsonResponse(result, safe=False)


def register_corp(request):
    flag1 = False
    flag2 = False
    password = request.POST.get('password')
    phone = request.POST.get('phone')
    email = request.POST.get('email')
    street = request.POST.get('street')
    city = request.POST.get('city')
    state = request.POST.get('state')
    zipcode = request.POST.get('zipcode')
    cor_name = request.POST.get('cor_name')
    emp_id = request.POST.get('emp_id')
    crn = request.POST.get('crn')

    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    cursor.execute("select COUNT(C_ID) from cky_customer")
    data = fetchJson(cursor)
    c_id = data[0]['COUNT(C_ID)'] + 1
    result = {
        'c_id': str(c_id),
    }
    # SQL 插入语句

    sql = "INSERT INTO cky_customer(`C_ID`,`C_TYPE`,`C_STREET`, `C_CITY`, `C_STATE`, `C_ZIPCODE`, `C_EMAIL`, `C_PHONE_NUM`, " \
          "`C_PASSWORD`) VALUES ('%d','%s', '%s', '%s', '%s', '%s','%s', '%s', '%s')" % (
              c_id, "C", street, city, state, zipcode, email, phone, password)
    sql2 = "INSERT INTO cky_corporate(`C_ID`,`C_TYPE`,`CORPORATION_NAME`, `REGIS_NUM`, `EMPLOYEE_ID`) VALUES ('%d', '%s', " \
           "'%s', '%s','%s')" % (c_id, "C", cor_name, crn, emp_id)
    try:
        # 执行sql语句
        # print(cursor.execute(sql))
        # print(cursor.execute(sql2))
        flag1 = True if cursor.execute(sql) == 1 else False
        flag2 = True if cursor.execute(sql2) == 1 else False

        # 执行sql语句
        db.commit()

    except Exception as ex:
        # 发生错误时回滚
        db.rollback()
        print(ex)

    # 关闭数据库连接
    db.close()
    return JsonResponse(result, safe=False)


def chooseOffice(request):
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    sql = "select OFFICE_ID, CONCAT(OFF_STREET,', ', OFF_CITY,', ',OFF_STATE,', ',OFF_ZIPCODE,', ',OFF_COUNTRY,', " \
          "Phone Number: ',OFF_PHONE_NUM) 'OFF_ADDRESS' FROM CKY_OFFICE; "
    cursor.execute(sql)
    data = fetchJson(cursor)
    result = {
        'data': data,
    }
    # 关闭数据库连接
    db.close()
    return JsonResponse(result, safe=False)


def chooseClass(request):
    current_office_id = request.POST.get('current_office_id')
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    sql = "SELECT C.CLASS_ID,V.CLASS_NAME FROM(( SELECT * FROM cky_vehicle_class) V NATURAL JOIN (select CLASS_ID " \
          "FROM CKY_VEHICLE WHERE OFFICE_ID = " + current_office_id + " and STATUS=0 GROUP BY CLASS_ID ) C); "
    cursor.execute(sql)
    data = fetchJson(cursor)
    result = {
        'data': data,
    }
    # 关闭数据库连接
    db.close()
    return JsonResponse(result, safe=False)


def chooseVehicle(request):
    current_office_id = request.POST.get('current_office_id')
    current_class_id = request.POST.get('current_class_id')
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    sql = "SELECT VEHICLE_ID,CONCAT( MAKE,', ',V_MODEL,', ',V_YEAR) AS VEHICLE_INFO FROM cky_vehicle WHERE CLASS_ID = " \
          + current_class_id + " AND OFFICE_ID = " + current_office_id + " AND STATUS = 0; "
    cursor.execute(sql)
    data = fetchJson(cursor)
    result = {
        'data': data,
    }
    # 关闭数据库连接
    db.close()
    return JsonResponse(result, safe=False)


def insertRental(request):
    flag = False
    flag2 = False
    c_id = request.POST.get('c_id')
    current_office_id = request.POST.get('current_office_id')
    current_class_id = request.POST.get('current_class_id')
    current_vehicle_id = request.POST.get('current_vehicle_id')
    pick_datetime = request.POST.get('pick_date')
    drop_datetime = request.POST.get('drop_date')

    M2mon = {'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6, 'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10,
             'Nov': 11, 'Dec': 12}
    pk_split = pick_datetime.split(' ')
    dp_split = drop_datetime.split(' ')
    pick_date = pk_split[3] + '-' + str(M2mon[pk_split[1]]) + '-' + pk_split[2]
    print(pick_date)
    drop_date = dp_split[3] + '-' + str(M2mon[dp_split[1]]) + '-' + dp_split[2]
    print(drop_date)
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()

    cursor.execute("select COUNT(R_ID) from cky_rental")
    r_cnt = fetchJson(cursor)
    r_id = r_cnt[0]['COUNT(R_ID)'] + 1

    cursor.execute("select C_TYPE from cky_customer where C_ID = " + c_id)
    ctype = fetchJson(cursor)[0]['C_TYPE']
    sql = "INSERT INTO cky_RENTAL(`R_ID`,`PICK_DATE`,`DROP_DATE`,`PICK_LOCATION`,`START_ODO`,`VEHICLE_ID`,`C_ID`," \
          "`C_TYPE`) VALUES ('%d',STR_TO_DATE('%s','%%Y-%%m-%%d'),STR_TO_DATE('%s','%%Y-%%m-%%d'),'%d','%d','%d'," \
          "'%d','%s')" % (
          int(r_id), pick_date, drop_date, int(current_office_id), 0, int(current_vehicle_id), int(c_id), str(ctype))
    try:
        # 执行sql语句
        flag = True if cursor.execute(sql) == 1 else False
        if (flag):
            sql_update = "UPDATE CKY_VEHICLE SET STATUS=1 WHERE VEHICLE_ID =" + current_vehicle_id
            flag2 = True if cursor.execute(sql_update) == 1 else False
        # 执行sql语句
        db.commit()

    except Exception as ex:
        # 发生错误时回滚
        db.rollback()
        print(ex)
    # 关闭数据库连接
    db.close()

    result = {
        "flag": flag & flag2,
        "r_id": r_id
    }
    return JsonResponse(result, safe=False)


def chooseCoupon(request):
    r_id = request.POST.get('r_id')
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    sql = "WITH THREE AS(SELECT * FROM cky_coupons NATURAL JOIN cky_coup_cust NATURAL JOIN cky_customer) SELECT " \
          "THREE.COUPON_ID,THREE.DISCOUNT FROM THREE, (SELECT DROP_DATE FROM cky_rental WHERE R_ID ="+r_id+") AS dropdate " \
          "WHERE  (C_ID = (SELECT C_ID FROM cky_rental WHERE R_ID = "+r_id+") AND (((SELECT COUNT(*) FROM THREE)=0) OR ((" \
          "SELECT COUNT(*)FROM THREE) >0) AND ((VALID_FROM IS NULL) OR (VALID_FROM<=dropdate.DROP_DATE AND " \
          "VALID_TO>=dropdate.DROP_DATE)))) "

    cursor.execute(sql)
    data = fetchJson(cursor)

    result = {
        'data': data,
    }
    # 关闭数据库连接
    db.close()
    return JsonResponse(result, safe=False)


def completeRental(request):
    flag = False
    r_id = request.POST.get('r_id')
    drop_office_id = request.POST.get('drop_office_id')
    current_coupon_id = request.POST.get('current_coupon_id')
    end_odo = request.POST.get('end_odo')
    odo_limit = request.POST.get('odo_limit')
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    sql_check = "select COUNT(INVOICE_ID) as 'check' FROM CKY_INVOICE WHERE R_ID = "+r_id
    cursor.execute(sql_check)
    check = fetchJson(cursor)
    print(check)
    if check[0]['check'] > 0:
        cursor.execute("delete from cky_invoice where r_id = "+r_id)
    if current_coupon_id == '':
        sql_update = "UPDATE CKY_RENTAL SET DROP_LOCATION = " + drop_office_id + ", END_ODO = " + end_odo + ", ODO_LIMIT = " + odo_limit + " WHERE (R_ID =" + r_id + ")"
    else:
        sql_update = "UPDATE CKY_RENTAL SET DROP_LOCATION = " + drop_office_id + ", END_ODO = " + end_odo + ", ODO_LIMIT = " + odo_limit + ",COUPON_ID = " + current_coupon_id + " WHERE (R_ID =" + r_id + ")"
    try:
        # 执行sql语句
        flag = True if cursor.execute(sql_update) == 1 else False
        # 执行sql语句
        db.commit()

    except Exception as ex:
        db.rollback()
        print(ex)
    # 关闭数据库连接

    db.close()
    return JsonResponse(flag, safe=False)


def displayInvoice(request):
    r_id = request.POST.get('r_id')
    # 打开数据库连接
    db = pymysql.connect(host="localhost", database="cky_scheme", user="root", passwd="123456")

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    sql = "SELECT INVOICE_ID, INVOICE_DATE, INVOICE_AMOUNT, R_ID FROM CKY_INVOICE WHERE R_ID = " + r_id
    cursor.execute(sql)
    data = fetchJson(cursor)
    print(r_id)
    print(data)
    # 关闭数据库连接
    db.close()
    result = {
        "data":data,
    }
    return JsonResponse(result, safe=False)




