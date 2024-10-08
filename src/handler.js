exports.handler = async (event,context) => {
  console.log("Inside the function!");
  console.log({ event, context });
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: "hello from localstack",
    }),
  };
  console.log("returning response");
  return response;
};
