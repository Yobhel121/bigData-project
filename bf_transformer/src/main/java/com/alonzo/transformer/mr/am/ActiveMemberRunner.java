package com.alonzo.transformer.mr.am;

import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.log4j.Logger;

import com.alonzo.common.EventLogConstants;
import com.alonzo.common.EventLogConstants.EventEnum;
import com.alonzo.transformer.model.dim.StatsUserDimension;
import com.alonzo.transformer.model.value.map.TimeOutputValue;
import com.alonzo.transformer.model.value.reduce.MapWritableValue;
import com.alonzo.transformer.mr.TransformerBaseRunner;

/**
 * 统计active member数量的执行入口类
 * 
 * @author alonzo
 *
 */
public class ActiveMemberRunner extends TransformerBaseRunner {
	private static final Logger logger = Logger.getLogger(ActiveMemberRunner.class);

	public static void main(String[] args) {
		System.setProperty("hadoop.home.dir", "E:\\大数据（全）\\大数据软件工具\\hadoop-2.5.0-cdh5.3.6\\hadoop-2.5.0-cdh5.3.6");
		ActiveMemberRunner runner = new ActiveMemberRunner();
		runner.setupRunner("active-member", ActiveMemberRunner.class, ActiveMemberMapper.class, ActiveMemberReducer.class, StatsUserDimension.class, TimeOutputValue.class, StatsUserDimension.class,
				MapWritableValue.class);
		try {
			runner.startRunner(args);
		} catch (Exception e) {
            logger.error("运行active member任务出现异常", e);
			throw new RuntimeException(e);
		}
	}

	@Override
	protected Filter fetchHbaseFilter() {
		FilterList filterList = new FilterList();
		// 定义mapper中需要获取的列名
		String[] columns = new String[] { EventLogConstants.LOG_COLUMN_NAME_MEMBER_ID, // 会员id
				EventLogConstants.LOG_COLUMN_NAME_SERVER_TIME, // 服务器时间
				EventLogConstants.LOG_COLUMN_NAME_PLATFORM, // 平台名称
				EventLogConstants.LOG_COLUMN_NAME_BROWSER_NAME, // 浏览器名称
				EventLogConstants.LOG_COLUMN_NAME_BROWSER_VERSION, // 浏览器版本号
				EventLogConstants.LOG_COLUMN_NAME_EVENT_NAME // 添加一个事件名称获取列，在使用singlecolumnvaluefilter的时候必须指定对应的列是一个返回列
		};
		filterList.addFilter(this.getColumnFilter(columns));
		// 只需要page view事件，所以进行过滤
		filterList.addFilter(new SingleColumnValueFilter(ActiveMemberMapper.family, Bytes.toBytes(EventLogConstants.LOG_COLUMN_NAME_EVENT_NAME), CompareOp.EQUAL, Bytes
				.toBytes(EventEnum.PAGEVIEW.alias)));

		return filterList;
	}

}
