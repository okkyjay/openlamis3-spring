/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fhi360.lamis.service.chart;

import org.fhi360.lamis.utility.DateUtil;
import org.fhi360.lamis.utility.JDBCUtil;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author user10
 */
@Component
public class HtsReferredChartService {

    private JDBCUtil jdbcUtil;

    public HtsReferredChartService() {

    }

    public Map<String, Object> getChartData(long ipId, long stateId, long lgaId, long facilityId, Date reportingDateBegin, Date reportingDateEnd) {

        Map<String, Object> map = new HashMap<String, Object>();
        String strDate = DateUtil.parseDateToString(reportingDateBegin, "yyyy-MM-dd");
        java.sql.Date reportingDate = java.sql.Date.valueOf(strDate);
        strDate = DateUtil.parseDateToString(reportingDateEnd, "yyyy-MM-dd");
        java.sql.Date reportingDate2 = java.sql.Date.valueOf(strDate);
        // map.put("month", month);
        // map.put("year", year);

        String query = "SELECT referred_from FROM hts WHERE date_visit  BETWEEN '" + reportingDate + "' AND '" + reportingDate2 + "'";
        if (stateId != 0) {
            query = query + " AND state_id = " + stateId;
        }
        if (lgaId != 0) {
            query = query + " AND lga_id = " + lgaId;
        }
        if (facilityId != 0) {
            query = query + " AND facility_id = " + facilityId;
        }

        int self = 0;
        int tb = 0;
        int sti = 0;
        int opd = 0;
        int fp = 0;
        int ward = 0;
        int blood = 0;
        int others = 0;
        try {
            ResultSet resultSet = execute(query);
            if (resultSet != null) {
                while (resultSet.next()) {
                    String referredFrom = resultSet.getString("referred_from");
                    if (referredFrom.equalsIgnoreCase("SELF")) {
                        self++;
                    }
                    if (referredFrom.equalsIgnoreCase("TB")) {
                        tb++;
                    }
                    if (referredFrom.equalsIgnoreCase("STI")) {
                        sti++;
                    }
                    if (referredFrom.equalsIgnoreCase("FP")) {
                        fp++;
                    }
                    if (referredFrom.equalsIgnoreCase("OPD")) {
                        opd++;
                    }
                    if (referredFrom.equalsIgnoreCase("WARD")) {
                        ward++;
                    }
                    if (referredFrom.equalsIgnoreCase("Blood bank")) {
                        blood++;
                    }
                    if (referredFrom.equalsIgnoreCase("Others")) {
                        others++;
                    }

                }

                map.put("SELF", self);
                map.put("TB", tb);
                map.put("STI", sti);
                map.put("FP", fp);
                map.put("OPD", opd);
                map.put("WARD", ward);
                map.put("BLOOD", blood);
                map.put("OTHERS", others);

            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return map;
    }

    public Map<String, Object> getChartDataByMonth(long ipId, long stateId, long lgaId, long facilityId, Date reportingDateBegin, Date reportingDateEnd) {

        Map<String, Object> map = new HashMap<String, Object>();
        String strDate = DateUtil.parseDateToString(reportingDateBegin, "yyyy-MM-dd");
        java.sql.Date reportingDate = java.sql.Date.valueOf(strDate);
        strDate = DateUtil.parseDateToString(reportingDateEnd, "yyyy-MM-dd");
        java.sql.Date reportingDate2 = java.sql.Date.valueOf(strDate);

        String query = "SELECT referred_from FROM hts WHERE date_visit  BETWEEN '" + reportingDate + "' AND '" + reportingDate2 + "'";
        if (stateId != 0) {
            query = query + " AND state_id = " + stateId;
        }
        if (lgaId != 0) {
            query = query + " AND lga_id = " + lgaId;
        }
        if (facilityId != 0) {
            query = query + " AND facility_id = " + facilityId;
        }

        int self = 0;
        int tb = 0;
        int sti = 0;
        int opd = 0;
        int fp = 0;
        int ward = 0;
        int blood = 0;
        int others = 0;

        try {
            ResultSet resultSet = execute(query);
            if (resultSet != null) {
                while (resultSet.next()) {
                    String referredFrom = resultSet.getString("referred_from");
                    if (referredFrom.equalsIgnoreCase("SELF")) {
                        self++;
                    }
                    if (referredFrom.equalsIgnoreCase("TB")) {
                        tb++;
                    }
                    if (referredFrom.equalsIgnoreCase("STI")) {
                        sti++;
                    }
                    if (referredFrom.equalsIgnoreCase("FP")) {
                        fp++;
                    }
                    if (referredFrom.equalsIgnoreCase("OPD")) {
                        opd++;
                    }
                    if (referredFrom.equalsIgnoreCase("WARD")) {
                        ward++;
                    }
                    if (referredFrom.equalsIgnoreCase("Blood bank")) {
                        blood++;
                    }
                    if (referredFrom.equalsIgnoreCase("Others")) {
                        others++;
                    }

                }

                map.put("SELF", self);
                map.put("TB", tb);
                map.put("STI", sti);
                map.put("FP", fp);
                map.put("OPD", opd);
                map.put("WARD", ward);
                map.put("BLOOD", blood);
                map.put("OTHERS", others);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return map;
    }

    private ResultSet execute(String query) {
        ResultSet rs = null;
        try {
            PreparedStatement preparedStatement = jdbcUtil.getStatement(query);
            rs = preparedStatement.executeQuery();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return rs;
    }
}