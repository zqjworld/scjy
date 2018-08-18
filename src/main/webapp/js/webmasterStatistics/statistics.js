var type_name=['服装鞋包','手机数码','美妆饰品','百货食品','运动户外','其他'];
var school_address=['燕山校区','舜耕校区','明水校区','圣井校区','莱芜校区'];

//画图
function drawImg(){
	
	getProCount();
	getUserCount();
	getForderCount();
	getForderCountZ();
	
}

//各类商品类别统计
function getProCount(){
	//alert(1);
	var count=[];
	var arr=getProType(7);
	var type_val=[];
	var url=baseurl+'product/getProCount';
	//alert(url);
	$.get(url,function(data){
		//console.log(data.length);
		for(var i=0;i<data.length;i++){
			type_val.push(data[i]['ptype']);
			count.push(parseInt(data[i]['id_count']));
		}
		if(arr.length!=type_val.length){
			for(var j=0;j<arr.length;j++){
				if(!contains(type_val,arr[j])){
					count.splice(j,0,0);
					
				}
			}
		}
		//alert(count);
		var option = {
			    title : {
			    	text: '各种类型商品所占比例',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: type_name
			    },
			    series : [
			        {
			            name: '数据展示',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:count[0], name:type_name[0]},
			                {value:count[1], name:type_name[1]},
			                {value:count[2], name:type_name[2]},
			                {value:count[3], name:type_name[3]},
			                {value:count[4], name:type_name[4]},
			                {value:count[5], name:type_name[5]}
			            ],
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
		//$("#productCount").empty();
		// 为echarts对象加载数据
		var myChart = echarts.init(document.getElementById('productCount'));
		myChart.setOption(option);
		var app={};
		app.currentIndex=-1;
		setInterval(function () {
		    var dataLen = option.series[0].data.length;
		    // 取消之前高亮的图形
		    myChart.dispatchAction({
		        type: 'downplay',
		        seriesIndex: 0,
		        dataIndex: app.currentIndex
		    });
		    app.currentIndex = (app.currentIndex + 1) % dataLen;
		    // 高亮当前图形
		    myChart.dispatchAction({
		        type: 'highlight',
		        seriesIndex: 0,
		        dataIndex: app.currentIndex
		    });
		    // 显示 tooltip
		    myChart.dispatchAction({
		        type: 'showTip',
		        seriesIndex: 0,
		        dataIndex: app.currentIndex
		    });
		}, 2000);
	});	
	
}


//各校区用户数量统计
function getUserCount(){
	var url=baseurl+'user/getUserCount';
	var address=[];
	var arr=getProType(6);
//	alert(arr);
	var count=[];
	$.get(url,function(data){
		for(var i=0;i<data.length;i++){
			//alert(data[i]['address']);
			address.push(data[i]['address']);
			count.push(data[i]['id_count']);
		}
		if(arr.length!=address.length){
			for(var j=0;j<arr.length;j++){
				if(!contains(address,arr[j])){
					count.splice(j,0,0);
				}
			}
		}
//		alert(school_address);
//		alert(count);
		var option = {
			    color: ['#3398DB'],
			    title : {
			    	text: '各校区用户数量统计',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis : [
			        {
			            type : 'category',
			            data : school_address,
			            axisTick: {
			                alignWithLabel: true
			            }
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'用户数量',
			            type:'bar',
			            barWidth: '60%',
			            data:count
			        }
			    ]
			};
		var myChart = echarts.init(document.getElementById('userCount'));
		myChart.setOption(option);
		
	});
	
	
}

//各校区订单数量统计
function getForderCount(){
	var url=baseurl+'forder/getForderCount';
	var saddress=[];
	var arr=getProType(6);
	var count=[];
	$.get(url,function(data){
		for(var i=0;i<data.length;i++){
			saddress.push(data[i]['saddress']);
			count.push(data[i]['id_count']);
		}
		if(saddress.length!=arr.length){
			for(var j=0;j<arr.length;j++){
				if(!contains(saddress,arr[j])){
					count.splice(j,0,0);
				}
			}
		}
		var option = {
				title : {
			    	text: '各校区订单数量比例',
			        x:'center'
			    },
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:school_address
			    },
			    series: [
			        {
			            name:'统计分析',
			            type:'pie',
			            radius: ['50%', '70%'],
			            avoidLabelOverlap: false,
			            label: {
			                normal: {
			                    show: false,
			                    position: 'center'
			                },
			                emphasis: {
			                    show: true,
			                    textStyle: {
			                        fontSize: '30',
			                        fontWeight: 'bold'
			                    }
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:[
			                {value:count[0], name:school_address[0]},
			                {value:count[1], name:school_address[1]},
			                {value:count[2], name:school_address[2]},
			                {value:count[3], name:school_address[3]},
			                {value:count[4], name:school_address[4]}
			            ]
			        }
			    ]
		};
		var myChart = echarts.init(document.getElementById('forderCountBySchoolAddress'));
		myChart.setOption(option);
		
	});
	
	

}

/*
 * 各校区订单数量折线图
 */
function getForderCountZ(){
	var url=baseurl+'forder/getForderCountZ';
	var dateArr=[];
	var count=[];
	$.get(url,function(data){
		for(var i=0;i<data.length;i++){
			dateArr.push(data[i]['f_time']);
			count.push(data[i]['id_count']);
		}
		
		var option = {
			    title: {
			        text: '订单数量逐日统计'
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:'订单数量'
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    toolbox: {
			        feature: {
			            saveAsImage: {}
			        }
			    },
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: dateArr
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [
			        {
			            name:'订单数量',
			            type:'line',
			            data:count
			        }
			    ]
			};
		var myChart = echarts.init(document.getElementById('forderCountByZheXian'));
		myChart.setOption(option);
		
	});
	
	

}


//获取商品类型数组
function getProType(val){
	var arr=[];
	for(var i=1;i<val;i++){
		arr.push(i);
	}
	return arr;
}

//查询某一元素在数组中是否存在
function contains(arr, val) {
	for ( var i = 0; i < arr.length; i++) {
		if (arr[i] == val)
			return true;
	}
	return false;
}