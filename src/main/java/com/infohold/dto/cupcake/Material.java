/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.dto.cupcake;

import com.infohold.dto.MaterialCity;

import java.util.List;

public class Material {
    public String cutPic;
    public String materialName;
    public String materialID;
    public String materialKind;
    public String price;
    public String materialState;
    public String selectPic;
    public String overPic;
    public String overfrontPic;
    public List<MaterialCity> materialCity;

    public String getCutPic() {
        return cutPic;
    }

    public void setCutPic(String cutPic) {
        this.cutPic = cutPic;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getMaterialID() {
        return materialID;
    }

    public void setMaterialID(String materialID) {
        this.materialID = materialID;
    }

    public String getMaterialKind() {
        return materialKind;
    }

    public void setMaterialKind(String materialKind) {
        this.materialKind = materialKind;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getMaterialState() {
        return materialState;
    }

    public void setMaterialState(String materialState) {
        this.materialState = materialState;
    }

    public String getSelectPic() {
        return selectPic;
    }

    public void setSelectPic(String selectPic) {
        this.selectPic = selectPic;
    }

    public String getOverPic() {
        return overPic;
    }

    public void setOverPic(String overPic) {
        this.overPic = overPic;
    }

    public String getOverfrontPic() {
        return overfrontPic;
    }

    public void setOverfrontPic(String overfrontPic) {
        this.overfrontPic = overfrontPic;
    }

    public List<MaterialCity> getMaterialCity() {
        return materialCity;
    }

    public void setMaterialCity(List<MaterialCity> materialCity) {
        this.materialCity = materialCity;
    }
}
