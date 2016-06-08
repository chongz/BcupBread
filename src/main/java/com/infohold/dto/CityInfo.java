/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.dto;

import java.util.List;

/**
 * Created by zhangchong on 5/17/16.
 */
public class CityInfo {
    public CityInfo() {

    }

    public String cityID;
    public String cityName;
    public String cityPic;
    public String cityRange;

    public List<StoreInfo> storeInfo;

    public String getCityID() {
        return cityID;
    }

    public void setCityID(String cityID) {
        this.cityID = cityID;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCityPic() {
        return cityPic;
    }

    public void setCityPic(String cityPic) {
        this.cityPic = cityPic;
    }

    public String getCityRange() {
        return cityRange;
    }

    public void setCityRange(String cityRange) {
        this.cityRange = cityRange;
    }

    public List<StoreInfo> getStoreInfo() {
        return storeInfo;
    }

    public void setStoreInfo(List<StoreInfo> storeInfo) {
        this.storeInfo = storeInfo;
    }
}