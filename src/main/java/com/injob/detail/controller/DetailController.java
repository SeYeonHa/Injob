package com.injob.detail.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.detail.domain.PostCompVo;
import com.injob.detail.mapper.DetailMapper;

@Controller
public class DetailController {

    @Autowired
    DetailMapper detailMapper;

    @GetMapping("/Detail/Detail")
    public ModelAndView getDetail(PostCompVo postCompVo) {
        // 공고 리스트를 가져옴
        List<PostCompVo> detailList = detailMapper.getDetailList2(postCompVo);

        // 각 공고의 남은 시간 계산
        for (PostCompVo detail : detailList) {
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime endDate = LocalDateTime.parse(detail.getPo_end_date(),
                    DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            Duration duration = Duration.between(now, endDate);
            long secondsRemaining = duration.getSeconds();

            // 남은 시간을 포맷
            long days = secondsRemaining / (60 * 60 * 24);
            long hours = (secondsRemaining % (60 * 60 * 24)) / (60 * 60);
            long minutes = (secondsRemaining % (60 * 60)) / 60;
            long seconds = secondsRemaining % 60;
            String remainingTime = String.format("%d일 %02d:%02d:%02d", days, hours, minutes, seconds);

            detail.setRemainingTime(remainingTime); // detail 객체에 남은 시간 추가
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("posting", detailList); // JSP로 공고 리스트 전달
        mv.setViewName("/detail/detail");

        return mv;
    }
}
