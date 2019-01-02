%%%%--------Question 26 from booklet--------%%%%%%%%%%%%
x=[1;2];
y=[-1 0 5];
p_mat=[0.3 0.3 0;0.1 0.2 0.1];
p_x=[sum((p_mat(1,:)));sum((p_mat(2,:)))];
p_y=[sum((p_mat(:,1))) sum((p_mat(:,2))) sum((p_mat(:,3)))];
E_x=sum(x'*p_x);
E_y=sum(y*p_y');
p_xgiveny=[p_mat(1,:)./p_y(1,:); p_mat(2,:)./p_y(1,:)] ;
p_ygivenx=[p_mat(:,1)./p_x(:,1) p_mat(:,2)./p_x(:,1) p_mat(:,3)./p_x(:,1)] ;
E_xgiveny=sum(x'*p_xgiveny);
E_ygivenx=sum(y*p_ygivenx');
d=(x-E_x)*(y-E_y);
cov_xy=sum(sum(d.*p_mat));
e=-log(p_mat).*p_mat;
q=-log(p_xgiveny).*p_mat;
w=-log(p_ygivenx).*p_mat;

e(isnan(e))=0;
q(isnan(q))=0;
w(isnan(w))=0;
H_xy=sum(sum(e));
H_x=sum(-log(p_x).*p_x);
H_y=sum(-log(p_y).*p_y);
H_xgiveny=sum(sum(q));
H_ygivenx=sum(sum(w));

mutual_info=H_x-H_xgiveny;
 if H_xy==H_x+H_y-mutual_info
     ok=1
 else
     ok=0
 end




