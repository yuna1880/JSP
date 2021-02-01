package com.bc.vo;
import lombok.*;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
@NoArgsConstructor
@RequiredArgsConstructor
public class PersonVO {
	
	@NonNull private String name;
	@NonNull private String age; 
	private String gender;
	private String[] hobby;
	
}
