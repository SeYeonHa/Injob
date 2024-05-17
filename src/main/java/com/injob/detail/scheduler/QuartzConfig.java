package com.injob.detail.scheduler;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

@Configuration
public class QuartzConfig {
	
	@Bean
	public JobDetail myJobDetail() {
		return JobBuilder.newJob().ofType(MyJob.class)
				.storeDurably()
				.withIdentity("myJob")
				.withDescription("My Job Description")
				.build();
	}
	
	@Bean
	public Trigger myJobTrigger() {
		SimpleScheduleBuilder scheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
				.withIntervalInSeconds(1) // 타이머 간격 설정 (test 후 1초로 변경)
				.repeatForever();
			
			return TriggerBuilder.newTrigger().forJob(myJobDetail() )
					.withIdentity("myTrigger")
					.withDescription("My Trigger Description")
					.withSchedule(scheduleBuilder)
					.build();
	}
	
	@Bean
    public SchedulerFactoryBean quartzScheduler() {
        SchedulerFactoryBean schedulerFactoryBean = new SchedulerFactoryBean();
        schedulerFactoryBean.setJobDetails(myJobDetail());
        schedulerFactoryBean.setTriggers(myJobTrigger());
        return schedulerFactoryBean;
    }
	
	
}
