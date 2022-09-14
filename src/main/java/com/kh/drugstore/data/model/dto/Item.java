package com.kh.drugstore.data.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	@JsonProperty("ENTRPS")
    private String ENTRPS;
    @JsonProperty("PRDUCT")
    private String PRDUCT;
    @JsonProperty("STTEMNT_NO")
    private Long STTEMNT_NO;
    @JsonProperty("REGIST_DT")
    private Long REGIST_DT;
    @JsonProperty("DISTB_PD")
    private String DISTB_PD;
    @JsonProperty("SUNGSANG")
    private String SUNGSANG;
    @JsonProperty("SRV_USE")
    private String SRV_USE;
    @JsonProperty("PRSRV_PD")
    private String PRSRV_PD;
    @JsonProperty("INTAKE_HINT1")
    private String INTAKE_HINT1;
    @JsonProperty("MAIN_FNCTN")
    private String MAIN_FNCTN;
    @JsonProperty("BASE_STANDARD")
    private String BASE_STANDARD;
}
