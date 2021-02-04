package com.bc.mybatis;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
public class CommVO {
	private String c_idx, writer, content, pwd,
	write_date, ip,	b_idx;

}
