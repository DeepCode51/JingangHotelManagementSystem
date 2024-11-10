package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import wyz.jingangHotel02.ssm.autoPo.CommentsWithBLOBs;

public interface CommentsService {
	
	public List<CommentsWithBLOBs> findTotalComments();
	
	public int insertComment(CommentsWithBLOBs comment);

	public int countCommentsByStatus(String status);

	public List<CommentsWithBLOBs> selectCommentsByStatus(String status,
			int begin, int pageSize);

	public void updateComment(CommentsWithBLOBs commentsWithBLOBs);
}
