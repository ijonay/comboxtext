<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>extjs 演示</title>
<!-- extjs的样式表 -->
<link type="text/css" href="extjs/resources/css/ext-all.css" rel="stylesheet" />
<!-- extjs的核心js文件 -->
<script type="text/javascript" src="extjs/ext-all-debug.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
	var store ;
	// $.ready()类似
	Ext.onReady(function (){
		// The data store containing the list of states
		// store 数据的仓储 也可以叫仓库，由它去加载数据
		var states = Ext.create('Ext.data.Store', {
			// 数据的模型定义
		    fields: ['abbr', 'name'],
		    proxy: {
		        type: 'ajax',
		        url : 'http://localhost:8080/comboxtext/user/queryUserCombox'
		    }
		    // 静态数据
		   /*  data : [
		        {"abbr":"AL", "name":"Alabama"},
		        {"abbr":"AK", "name":"Alaska"},
		        {"abbr":"AZ", "name":"Arizona"}
		        //...
		    ] */
		});

		// Create the combo box, attached to the states data store
		// 创建一个下拉框，把store应用上
		Ext.create('Ext.form.ComboBox', {
			// 标题
		    fieldLabel: 'Choose State',
		    // 上面的store对象
		    store: states,
		    // 从本地读取数据
		    // queryMode: 'local',
		    // 显示字段名配置
		    displayField: 'name',
		    // 值域字段的配置
		    valueField: 'abbr',
		    // 渲染到html的标签组件上
		    renderTo: 'comboId',
		    // 事件配置
		    listeners:{
		    	// 选择事件
		         'select': function(){
		        	 // 当前的组件对象
		        	 alert(this.getValue());
		         }
		    }
		});
		
		
		// 开始创建一个extjs的表格
		// 需要放在Ext.onReady里面
		store = Ext.create('Ext.data.Store', {
			// 自动去加载数据
			autoLoad : true,
			pageSize: 10, // 每页的条目数量
			// 定义了一个id
		    //storeId:'simpsonsStore',
		    // 字段定义项目，与后台放回的数据模型一直
		    fields:['id', 'name', 'address', 'phone'],
		    /* data:{'items':[
		        { 'name': 'Lisa',  "email":"lisa@simpsons.com",  "phone":"555-111-1224"  },
		        { 'name': 'Bart',  "email":"bart@simpsons.com",  "phone":"555-222-1234" },
		        { 'name': 'Homer', "email":"home@simpsons.com",  "phone":"555-222-1244"  },
		        { 'name': 'Marge', "email":"marge@simpsons.com", "phone":"555-222-1254"  }
		   		 ],'items2':[
				        { 'name': 'Lisa2',  "email":"lisa@simpsons.com",  "phone":"555-111-1224"  },
				        { 'name': 'Bart2',  "email":"bart@simpsons.com",  "phone":"555-222-1234" },
				        { 'name': 'Homer2', "email":"home@simpsons.com",  "phone":"555-222-1244"  },
				        { 'name': 'Marge2', "email":"marge@simpsons.com", "phone":"555-222-1254"  }
				    ]}, */
		    proxy: {
		    	// ajax异步请求加载数据
		        type: 'ajax',
		        url: 'http://localhost:8080/comboxtext/user/queryUserList',  // 一个url，将加载start和limit参数并返回期望的数据
		        reader: {
		        	// 使用json
		            type: 'json',
		            // root：根节点，你告诉它使用哪个节点下数据
		            root: 'rows',
		            // 总数对应的字段名
		            totalProperty: 'total'
		        }
		    }
		    /* proxy: {
		    	// 本地
		        type: 'memory',
		        reader: {
		        	// 使用json格式
		            type: 'json',
		            // root：根节点，你告诉它使用哪个节点下数据
		            root: 'items2'
		        }
		    } */
		});

		Ext.create('Ext.grid.Panel', {
			// 标题
		    title: '标题',
		    // 使用上面store的id
		    //store: Ext.data.StoreManager.lookup('simpsonsStore'),
		    // 前面的store是配置项，后面的是上面已经初始化的store对象
		    store : store,
		    // 指定显示的字段，header：表头，dataIndex：跟store的
		    columns: [
		        { header: 'Id', dataIndex: 'id', flex: 1 },
		        { header: 'Name',  dataIndex: 'name' },
		        { header: 'address', dataIndex: 'address',
// 		        	renderer: function(value){
// 		        		// 改变了渲染值
// 		        		if(value == "1"){
// 		        			return "男";
// 		        		}else{
// 		        			return "女";
// 		        		}
// 		        	}
	        	},
	        	{ header: 'phone',  dataIndex: 'phone' }
		    ],
		    height: 400,
		    width: 400,
		    dockedItems: [{
		        xtype: 'pagingtoolbar',
		        store: store,   // GridPanel使用相同的数据源
		        dock: 'bottom',
		        displayInfo: true
		    }],
		    // 渲染到页面元素上
		    renderTo: 'gridId'
		});
		
	});
	
	
	
</script>
</head>
<body>
	<h4>下拉框</h4>
	<div id="comboId"></div>
	
	
	<h4>列表</h4>
	<div id="gridId"></div>
</body>
</html>