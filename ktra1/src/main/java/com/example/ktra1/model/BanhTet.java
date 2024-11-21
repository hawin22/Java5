package com.example.ktra1.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BanhTet {
    private int id;
    private String ten;
    private float gia;
    private boolean ngon;

}
