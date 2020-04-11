package com.liu.graduation.entities.support;

import xyz.downgoon.snowflake.Snowflake;

public  class SnowFlakeIdGenerator {
	private static final  Snowflake snowFlake  = new Snowflake(1,2);

	public static String getNextId() {
	    return String.valueOf(snowFlake.nextId());
	  }

}
