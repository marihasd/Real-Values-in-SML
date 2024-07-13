%Programming Assignment 5: Matlab
%Submitted 20 January 2024 11:30pm
%Submitted code works in Matlab. To test, type D= mcholerr(n) where n can be replaced with the size of your choice.

%create new function mcholerr that accepts n

function D = mcholerr(n)

	% Check if n is an even integer greater than or equal to 20

	if rem(n,2) == 0 && n>=20
		
	% Create random matrix of size n

	A = randn(n);
	
	% Find transpose of A
	
	B = A * transpose(A);
	
	% Perform a Cholesky Decomposition on B
	
	R = chol(B);
	
	% Multiply the triangles of R, where R is the lower triangle and R'
	% (R transpose) is the upper triangle.

	C = R * R'
	
	% Subtract B from C to get D
	
	D = C - B

 	% Count non-zero elements in different quarters of matrix D

        num_nonzero_upper_left = nnz(D(1:n/2, 1:n/2));
        num_nonzero_upper_right = nnz(D(1:n/2, n/2+1:end));
        num_nonzero_lower_left = nnz(D(n/2+1:end, 1:n/2));
        num_nonzero_lower_right = nnz(D(n/2+1:end, n/2+1:end));

        % Calculate the sums of non-zero values in different quarters of matrix D

        sum_nonzero_upper_left = sum(sum(D(1:n/2, 1:n/2)));
        sum_nonzero_upper_right = sum(sum(D(1:n/2, n/2+1:end)));
        sum_nonzero_lower_left = sum(sum(D(n/2+1:end, 1:n/2)));
        sum_nonzero_lower_right = sum(sum(D(n/2+1:end, n/2+1:end)));

        % Return a two-column, four-row matrix with counts and sums of non-zero elements

        D = [num_nonzero_upper_left, sum_nonzero_upper_left;
             num_nonzero_upper_right, sum_nonzero_upper_right;
             num_nonzero_lower_left, sum_nonzero_lower_left;
             num_nonzero_lower_right, sum_nonzero_lower_right];
    else

        % If n is not an even integer greater than or equal to 20, return an empty matrix

        D = [];
        disp('Input parameter should be an even integer greater than or equal to 20.');
    end
end
