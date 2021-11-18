package co.micol.prj.cart.mapper;

import java.util.List;

import co.micol.prj.cart.vo.CartVO;

public interface CartMapper {
	//public 없어도 다 public으로 바뀜
	public List<CartVO> cartSelectList();
	public void cartDeleteAll();
	public void cartDelete(CartVO vo); //#{no} 있으므로 CartVO vo 넣어줌
}
