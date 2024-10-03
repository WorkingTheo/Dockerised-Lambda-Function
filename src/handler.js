exports.handler = async (event) => {
  console.log("Inside the function!");
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: "hello from localstack",
    }),
  };
  console.log("returning response");
  return response;
};
